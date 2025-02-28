import 'package:buddy/logic/torque_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StrengthButton extends ConsumerWidget {
  const StrengthButton({super.key, required this.title, required this.index});
  final String title;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(Providers().strengthProvider)['$index'] ?? false;
    String imageName = title.replaceAll(' ', '_');

    Color selectedColor = isSelected ? Color(0xffe5f1ff) : Colors.black;

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 4,
        child: Material(
          color: isSelected ? Color(0xffe5f1ff) : Colors.black,
          elevation: 6,
          borderRadius: BorderRadius.circular(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: isSelected ? AssetImage('assets/Black/$imageName.png') : AssetImage('assets/White/$imageName.png'),
                      fit: BoxFit.cover, // Adjusts the image to cover the entire container
                    ),
                  ),
              ),
              Text(
                title,
                style: TextStyle(color: isSelected ? Colors.black : Colors.white),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        ref.read(Providers().strengthProvider.notifier).setStrength('$index');
        ref.read(Providers().strengthNameProvider.notifier).setName(title);
      },
    );
  }
}
