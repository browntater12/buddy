import 'package:buddy/logic/torque_logic.dart';
import 'package:buddy/widgets/fasteners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TorqueOutput extends ConsumerWidget {
  const TorqueOutput({super.key});
  
  double calculate (kfactor, size, strength, threadType){
    return (kfactor * fasteners['inch'][threadType][size]['diameter'] * 859) / 12;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String threadType = ref.watch(isCourseProvider) ? 'coarse' : 'fine';
    String sizeName = ref.watch(isCourseProvider) ? ref.watch(sizeNameProvider) : ref.watch(fineNameProvider);
    // calculate(ref.watch(kFactorProvider), ref.watch(sizeProvider), ref.watch(strengthProvider));
    // return  Text(ref.watch(torqueProvider).toString());
    var size = fasteners['inch'][threadType][sizeName]['diameter'] ?? 0;
    var kfactor = ref.watch(kFactorProvider);

    var strength =  fasteners['inch'][threadType][sizeName]['${ref.watch(strengthNameProvider).replaceAll(" ", "_")}_Clamp_Load'] ?? 0;
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
          Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(color:  Color.fromRGBO(65, 65, 65, 1), borderRadius: BorderRadius.circular(3)),
              child: Text('INCH', style: TextStyle(color: Colors.white),),
            ),
          // Text('Clampload:\n $strength lbs', style: TextStyle(fontSize: 40, color: Colors.white),),
          Text('$torque', style: TextStyle(fontSize: 90, color: Colors.white),),
          Text('ft-lbs',style: TextStyle(color: Colors.white),)

        ]
          ),
    );
  }
}