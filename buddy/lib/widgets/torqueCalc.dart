import 'package:buddy/logic/torque_logic.dart';
import 'package:buddy/widgets/fasteners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TorqueOutput extends ConsumerWidget {
  const TorqueOutput({super.key});
  
  double calculate (kfactor, size, strength){
    return (kfactor * fasteners['inch']['coarse'][size]['diameter'] * 859) / 12;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // calculate(ref.watch(kFactorProvider), ref.watch(sizeProvider), ref.watch(strengthProvider));
    // return  Text(ref.watch(torqueProvider).toString());
    var size = fasteners['inch']['coarse'][ref.watch(sizeNameProvider).toString()]['diameter'];
    var kfactor = ref.watch(kFactorProvider);

    var strength =  fasteners['inch']['coarse'][ref.watch(sizeNameProvider).toString()]['${ref.watch(strengthNameProvider).replaceAll(" ", "_")}_Clamp_Load'];
    
    var torque = (size * kfactor * strength)/12;
    if (torque < 100){
      torque = num.parse(torque.toStringAsFixed(1));
    } else {
      torque = torque.round();
    }
    return Column(
      children: [
        Text(size.toString()),
        Text(kfactor.toString()),
        Text(strength.toString()),
        Text(torque.toString()),
      ]
        );
  }
}