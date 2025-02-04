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

    var strength =  fasteners['inch']['coarse'][ref.watch(sizeNameProvider).toString()]['${ref.watch(strengthNameProvider).replaceAll(" ", "_")}_Clamp_Load'] ?? 0;
    var torque = (size * kfactor * strength)/12;
    if (torque < 100){
      torque = num.parse(torque.toStringAsFixed(1));
    } else {
      torque = torque.round();
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          // Text('Clampload:\n $strength lbs', style: TextStyle(fontSize: 40, color: Colors.white),),
          Text('$torque ft/lbs', style: TextStyle(fontSize: 50, color: Colors.white),)
        ]
          ),
    );
  }
}