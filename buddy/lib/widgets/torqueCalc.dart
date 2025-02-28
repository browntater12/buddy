import 'package:buddy/logic/torque_logic.dart';
import 'package:buddy/data/fasteners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TorqueOutput extends ConsumerWidget {
  const TorqueOutput({super.key});

  double calculate(kfactor, size, strength, threadType) {
    return (kfactor * fasteners['inch'][threadType][size]['diameter'] * 859) / 12;
  }
  dynamic torqueCalculation(ref){
    String threadType =
        ref.watch(Providers().threadSizeProvider) ? 'coarse' : 'fine';
    String sizeName = ref.watch(Providers().threadSizeProvider)
        ? ref.watch(Providers().sizeNameProvider)
        : ref.watch(Providers().fineNameProvider);
    var size = fasteners['inch'][threadType][sizeName]['diameter'] ?? 0;
    var kfactor = ref.watch(Providers().kFactorProvider);
    String strengthKey =
        '${ref.watch(Providers().strengthNameProvider).replaceAll(" ", "_")}_Clamp_Load';
    var strength = fasteners['inch'][threadType][sizeName][strengthKey] ?? 0;

    var torque = (size * kfactor * strength) / 12;
    if (ref.watch(Providers().workProvider)) {
      if (torque < 100) {
        torque = num.parse(torque.toStringAsFixed(1));
      } else {
        torque = torque.round();
      }
    } else {
      torque = torque * 1.355818;
      if (torque < 100) {
        torque = num.parse(torque.toStringAsFixed(1));
      } else {
        torque = torque.round();
      }
    }
//TODO: fix torque being added into database    // ref.read(Providers().torqueProvider.notifier).state = torque;
    return torque;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(65, 65, 65, 1),
                  borderRadius: BorderRadius.circular(3)),
              child: Text(
                'INCH',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              '${torqueCalculation(ref).toString()}',
              style: TextStyle(fontSize: 90, color: Colors.white),
            ),
            Text(
              ref.watch(Providers().workProvider) ? 'ft-lbs' : 'Nm',
              style: TextStyle(color: Colors.white),
            )
          ]),
    );
  }
}
