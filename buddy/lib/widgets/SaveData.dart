import 'package:flutter/material.dart';
import 'package:buddy/pages/saved.dart';
import 'package:buddy/data/local_db_helper.dart';
import '../colors/colors.dart' as colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/logic/torque_logic.dart';

class SaveData extends ConsumerWidget {
  void _addItem(String name, double torque) async {
    await DatabaseHelper.insertItem(name, torque);
    print('${name} ${torque}');
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Add listeners for UI changes
    ref.listen(Providers().strengthNameProvider, (previous, next) {
      ref.read(Providers().boltDetailsAddedProvider.notifier).state = false;
    });
    
    ref.listen(Providers().sizeNameProvider, (previous, next) {
      ref.read(Providers().boltDetailsAddedProvider.notifier).state = false;
    });
    
    ref.listen(Providers().kFactorProvider, (previous, next) {
      ref.read(Providers().boltDetailsAddedProvider.notifier).state = false;
    });

    String _getBoltDetails(){
    String boltDetails = "";
    String size = "";
    if(ref.watch(Providers().threadSizeProvider)){
      size = ref.watch(Providers().sizeNameProvider);
    }
    else{
      size = ref.watch(Providers().fineNameProvider);
    }
    String strength = ref.watch(Providers().strengthNameProvider);
    String kFactor = ref.watch(Providers().kFactorProvider).toString();
    boltDetails = "$strength $size $kFactor k";
    return boltDetails;
  }
  bool _BoltDetailsAdded([bool? added]) {
    if (added == true) {
      return true;
    }
    return false;
  }

    return IconButton(
      onPressed: () {
        String data = ref.watch(Providers().sizeNameProvider).toString();
        ref.read(Providers().boltDetailsAddedProvider.notifier).state = true;
        _addItem(_getBoltDetails(), ref.watch(Providers().torqueProvider));

      },
      icon: Icon(
        ref.watch(Providers().boltDetailsAddedProvider) ? Icons.bookmark_added : Icons.bookmark_add_outlined,
        size: 30,
      ),
      color: colors.iconColor,
    );
  }
}
