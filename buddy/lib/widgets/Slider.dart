import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/logic/torque_logic.dart';

class SliderExample extends ConsumerWidget {
  double _currentSliderValue = 0.15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text("Select K factor"),
        Text(ref.watch(kFactorProvider).toString(), style: TextStyle(fontSize: 25),),
        Slider(
            value: ref.watch(kFactorProvider),
            min: 0.13,
            max: 0.20,
            divisions: 7,
            onChanged: (double value) {
                _currentSliderValue = value;
                ref.read(kFactorProvider.notifier).setKfactor(value);
            }
        ),
        const Padding(
          padding: EdgeInsets.only(left:8.0, right:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Ecoguard'),
            Text("Dry"),
          ],),
        ),
        
      ],
    );
  }
}