import 'package:buddy/logic/torque_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Unit extends ConsumerWidget {
  final Function(bool) onChanged;
  const Unit({super.key, required this.onChanged});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Switch(
        value: ref.watch(UnitsProvider),
        activeColor: Colors.blue,
        inactiveThumbColor: Colors.red,
        inactiveTrackColor: Colors.red[200],
        onChanged: (value) {
          onChanged(value);  // Call the callback
          ref.read(UnitsProvider.notifier).setUnits(value);
        },
      ),
    );
  }
}

class ThreadSize extends ConsumerWidget {
  const ThreadSize({super.key, this.onChanged});
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return 
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Switch(
          value: ref.watch(threadSizeProvider),
          activeColor: Colors.blue,
          inactiveThumbColor: Colors.red,
          inactiveTrackColor: Colors.red[200],
          onChanged: (value) {
            ref.read(threadSizeProvider.notifier).state = value;
            onChanged?.call(value);
          },
        ),
      );
  }
}