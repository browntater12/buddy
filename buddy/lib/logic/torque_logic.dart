import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final kFactorProvider = NotifierProvider<KFactor, double>(KFactor.new);

class KFactor extends Notifier<double>{
  @override
  double build(){
    return 0.20;
    }
  void setKfactor(double value){
    state=value;
  }
}


final strengthProvider = NotifierProvider<Strength, Map<String, bool>>(Strength.new);

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

final strengthNameProvider = NotifierProvider<StrengthName, String>(StrengthName.new);

class StrengthName extends Notifier<String>{
  @override
  String build(){
    return "";
    }
  void setName(String selected) {
	    state = selected;
	  }
}

final sizeNameProvider = NotifierProvider<SizeName, String>(SizeName.new);

class SizeName extends Notifier<String>{
  @override
  String build(){
    return "1/4-20";
    }
  void setName(String selected) {
	    state = selected;
	  }
}



final sizeProvider = NotifierProvider<Size, int>(Size.new);

class Size extends Notifier<int>{
  @override
  int build(){
    return 0;
    }
  void setSize(int value){
    state=value;
  }
}

final fineNameProvider = NotifierProvider<FineName, String>(FineName.new);

class FineName extends Notifier<String>{
  @override
  String build(){
    return "1/4-28";
    }
  void setName(String selected) {
	    state = selected;
	  }
}



final fineProvider = NotifierProvider<Fine, int>(Fine.new);

class Fine extends Notifier<int>{
  @override
  int build(){
    return 0;
    }
  void setFine(int value){
    state=value;
  }
}


final torqueProvider = NotifierProvider<Torque, double>(Torque.new);
class Torque extends Notifier<double>{
  @override
  double build(){
    return 0.0;
    }
  void setTorque(double  value){
    state=value;
  }
}

final UnitsProvider = NotifierProvider<Units, bool>(Units.new);

class Units extends Notifier<bool>{
  @override
  bool build(){
    return true;
  }
  void setUnits(bool value){
    state=value;
  }
}

final threadSizeProvider = NotifierProvider<ThreadSizes, bool>(ThreadSizes.new);

class ThreadSizes extends Notifier<bool>{
  @override
  bool build(){
    return true;
  }
  void setThreadSize(bool value){
    state=value;
  }
}

final isCourseProvider = NotifierProvider<IsCourse, bool>(IsCourse.new);

class IsCourse extends Notifier<bool>{
  @override
  bool build(){
    return true;
  }
  void setIsCourse(bool value){
    state=value;
  }
}

final termsProvider = NotifierProvider<Terms, bool>(Terms.new);

class Terms extends Notifier<bool>{
  @override
  bool build(){
    return false;
  }
  void setIsTermsAccepted(bool value){
    state=value;
  }
}