import 'package:buddy/logic/torque_logic.dart';
import 'package:buddy/data/fasteners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/logic/torqueLogic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
String torqueCalculation(ref){
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
    return finalTorque.toString();
}
    
class TorqueOutput extends ConsumerStatefulWidget {
  const TorqueOutput({super.key});

  @override
  ConsumerState<TorqueOutput> createState() => _TorqueOutputState();
}

class _TorqueOutputState extends ConsumerState<TorqueOutput> {
  String _torqueValue = '0.0';

  void _updateTorque() {
    setState(() {
      _torqueValue = torqueCalculation(ref);
      ref.read(Providers().torqueProvider.notifier).state.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen to changes in providers that affect torque calculation
    ref.listen(Providers().strengthNameProvider, (_, __) => _updateTorque());
    ref.listen(Providers().sizeNameProvider, (_, __) => _updateTorque());
    ref.listen(Providers().kFactorProvider, (_, __) => _updateTorque());
    ref.listen(Providers().workProvider, (_, __) => _updateTorque());
    ref.listen(Providers().threadSizeProvider, (_, __) => _updateTorque());

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(65, 65, 65, 1),
              borderRadius: BorderRadius.circular(3)
            ),
            child: const Text(
              'INCH',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            _torqueValue,
            style: const TextStyle(fontSize: 90, color: Colors.white),
          ),
          Text(
            ref.watch(Providers().workProvider) ? 'ft-lbs' : 'Nm',
            style: const TextStyle(color: Colors.white),
          )
        ]
      ),
    );
  }
}
