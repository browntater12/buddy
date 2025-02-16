import 'package:buddy/logic/torque_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Unit extends ConsumerWidget {
  const Unit({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return 
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Switch(
          value: ref.watch(UnitsProvider),
          activeColor: Colors.blue,
          inactiveThumbColor: Colors.red,
          inactiveTrackColor: Colors.red[200],
          onChanged: (bool value) {
            print('Switched to ${value ? 'inch' : 'metric'}');
            ref.read(UnitsProvider.notifier).setUnits(value);
          },
        ),
      );
  }
}

class ThreadSize extends ConsumerWidget {
  const ThreadSize({super.key});
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
          onChanged: (bool value) {
            print('Switched to ${value ? 'course' : 'fine'}');
            ref.read(threadSizeProvider.notifier).setThreadSize(value);
          },
        ),
      );
  }
}