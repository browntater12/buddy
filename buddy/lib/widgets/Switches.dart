import 'package:buddy/logic/torque_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:buddy/logic/torque_logic.dart';

class SettingsSwitch extends ConsumerWidget {
  final String userHelperText;
  final String settingTitle;
  final (String, String) settingOptions;
  final NotifierProvider<dynamic, bool> provider;
  const SettingsSwitch({
    super.key,
    required this.userHelperText,
    required this.settingTitle, 
    required this.settingOptions,
    required this.provider,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 12.0),
      child: Row(
        children:[
          Expanded(flex: 2, child: Text(userHelperText, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),
          Text(ref.watch(provider) ? settingOptions.$1 : settingOptions.$2),
          Switch(
            value: ref.watch(provider),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red[200],
            onChanged: (value) async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool(settingTitle, value);
              ref.read(provider.notifier).state = value;
            }
          ),
        ],
      ),
    );
  }
}