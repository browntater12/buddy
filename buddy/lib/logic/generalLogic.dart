import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class Providers {
  Providers._(); // Private constructor
  
  static final Providers _instance = Providers._();
  
  factory Providers() {
    return _instance;
  }

  final kFactorProvider = NotifierProvider<KFactor, double>(KFactor.new);
  final strengthProvider = NotifierProvider<Strength, Map<String, bool>>(Strength.new);
  final sizeProvider = NotifierProvider<Size, int>(Size.new);
  final fineProvider = NotifierProvider<Fine, int>(Fine.new);
  final torqueProvider = NotifierProvider<Torque, double>(Torque.new);
  final UnitsProvider = NotifierProvider<Units, bool>(Units.new);
  final threadSizeProvider = NotifierProvider<ThreadSizes, bool>(ThreadSizes.new);
  final isCourseProvider = NotifierProvider<IsCourse, bool>(IsCourse.new);
  final termsProvider = NotifierProvider<Terms, bool>(Terms.new);
  final workProvider = NotifierProvider<Work, bool>(Work.new);
  final strengthNameProvider = NotifierProvider<StrengthName, String>(StrengthName.new);
  final sizeNameProvider = NotifierProvider<SizeName, String>(SizeName.new);
  final fineNameProvider = NotifierProvider<FineName, String>(FineName.new);
  final boltDetailsAddedProvider = NotifierProvider<BoltDetailsAdded, bool>(BoltDetailsAdded.new);

  NotifierProvider<Notifier<dynamic>, dynamic> getProvider(String providerName) {
    switch (providerName) {
      case 'UnitsProvider':
        return UnitsProvider;
      case 'threadSizeProvider':
        return threadSizeProvider;
      case 'isCourseProvider':
        return isCourseProvider;
      case 'termsProvider':
        return termsProvider;
      case 'workProvider':    
        return workProvider;
      case 'kFactorProvider':
        return kFactorProvider;
      case 'strengthProvider':
        return strengthProvider;
      case 'strengthNameProvider':
        return strengthNameProvider;
      case 'sizeProvider':
        return sizeProvider;
      case 'sizeNameProvider':
        return sizeNameProvider;
      case 'fineProvider':
        return fineProvider;
      case 'fineNameProvider':
        return fineNameProvider;
      case 'torqueProvider':
        return torqueProvider;
      case 'boltDetailsAddedProvider':
        return boltDetailsAddedProvider;
      default:
        throw ArgumentError('Unknown provider name: $providerName');
    }
  }
}
class Torque extends Notifier<double>{
  @override
  double build(){
    return 0.0;
  }
  void setTorque(double value){
    state=value;
  }
}

class BoltDetailsAdded extends Notifier<bool>{
  @override
  bool build(){
    return false;
  }
}
class KFactor extends Notifier<double>{
  @override
  double build(){
    return 0.20;
    }
  void setKfactor(double value){
    state=value;
  }
}

class Strength extends Notifier<Map<String, bool>>{
  @override
  Map<String, bool> build(){
    return {
      '0': false,
      '1': false,
      '2': false,
      '3': false,
      '4': false,
      };
    }
  void setStrength(String selected) {
	    state = {for (var key in state.keys) key: key == selected ? true : false};
	  }
}


class StrengthName extends Notifier<String>{
  @override
  String build(){
    return "";
    }
  void setName(String selected) {
	    state = selected;
	  }
}

class SizeName extends Notifier<String>{
  @override
  String build(){
    return "1/4-20";
    }
  void setName(String selected) {
	    state = selected;
	  }
}

class Size extends Notifier<int>{
  @override
  int build(){
    return 0;
    }
  void setSize(int value){
    state=value;
  }
}

class FineName extends Notifier<String>{
  @override
  String build(){
    return "1/4-28";
    }
  void setName(String selected) {
	    state = selected;
	  }
}

class Fine extends Notifier<int>{
  @override
  int build(){
    return 0;
    }
  void setFine(int value){
    state=value;
  }
}

class Units extends Notifier<bool>{
  @override
  bool build(){
    return true;
  }
  void setUnits(bool value){
    state=value;
  }
}


class ThreadSizes extends Notifier<bool>{
  @override
  bool build(){
    return true;
  }
  void setThreadSize(bool value){
    state=value;
  }
}


class IsCourse extends Notifier<bool>{
  @override
  bool build(){
    return true;
  }
  void setIsCourse(bool value){
    state=value;
  }
}

class Terms extends Notifier<bool>{
  @override
  bool build(){
    return false;
  }
  void setIsTermsAccepted(bool value){
    state=value;
  }
}

class Work extends Notifier<bool>{
  @override
  bool build(){
    return true;
  }
  void setIsFootPounds(bool value){
    state=value;
  }
}

