import 'package:buddy/data/fasteners.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/logic/generalLogic.dart';
import 'package:flutter/material.dart';

class TorqueLogic extends ConsumerWidget {
  const TorqueLogic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    double finalTorque;
    
    if (ref.watch(Providers().workProvider)) {
      finalTorque = torque < 100 
          ? double.parse(torque.toStringAsFixed(1))
          : torque.roundToDouble();
    } else {
      torque = torque * 1.355818;
      finalTorque = torque < 100
          ? double.parse(torque.toStringAsFixed(1))
          : torque.roundToDouble();
    }
    ref.read(Providers().torqueProvider.notifier).state = finalTorque;

    return Text(
      finalTorque.toString(),
      style: const TextStyle(fontSize: 90, color: Colors.white),
    );
  }
}