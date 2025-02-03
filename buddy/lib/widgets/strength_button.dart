import 'package:buddy/logic/torque_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StrengthButton extends ConsumerWidget {
  const StrengthButton({super.key, required this.title, required this.image, required this.index});
  final String title;
  final Image image;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(strengthProvider)['$index'] ?? false;

    return GestureDetector(
      child: Container(  
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isSelected ? Color.fromRGBO(218, 255, 125, 0.5) : null,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: image),
              Text(title, style: const TextStyle(color: Color.fromRGBO(247, 247, 255, 1)),),
            ],
        ),
      ),
      onTap: () {
        ref.read(strengthProvider.notifier).setStrength('$index');
        ref.read(strengthNameProvider.notifier).setName(title);
      },
    );
  }
}


