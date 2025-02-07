import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/logic/torque_logic.dart';

class SliderExample extends ConsumerWidget {
  double _currentSliderValue = 0.15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(ref.watch(kFactorProvider).toString(), style: TextStyle(fontSize: 30, color: Colors.white),),
        Text('k factor',style: TextStyle(color: const Color.fromARGB(255, 127, 121, 121)),),
        Slider(
            value: ref.watch(kFactorProvider),
            min: 0.13,
            max: 0.20,
            divisions: 7,
            thumbColor: Color(0xFFF4FFDC),
            activeColor: Color(0xFFF4FFDC),
            onChanged: (double value) {
                _currentSliderValue = value;
                ref.read(kFactorProvider.notifier).setKfactor(value);
            }
        ),
        Padding(
          padding: EdgeInsets.only(left:20.0, right:20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Zinc Flake', style: TextStyle(color: Colors.white, fontSize: 15), ),
            Text("Zinc Plated", style: TextStyle(color: Colors.white, fontSize: 15)),
          ],),
        ),
        
      ],
    );
  }
}