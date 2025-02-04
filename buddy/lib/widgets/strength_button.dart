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
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
                  color: isSelected ? Color.fromRGBO(193, 237, 204,0.5) : null,
                  borderRadius: BorderRadius.circular(5),
                ),
        width: MediaQuery.of(context).size.width / 4,
        child: Material(
          color: Color(0xFF1da1f2),
          elevation: 6,
          borderRadius: BorderRadius.circular(8.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: image),
                Text(title, style: const TextStyle(color: Colors.white),),
              ],
          ),
        ),
      ),
      onTap: () {
        ref.read(strengthProvider.notifier).setStrength('$index');
        ref.read(strengthNameProvider.notifier).setName(title);
      },
    );
  }
}


