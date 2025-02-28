import 'dart:io';

import 'package:flutter/material.dart';
import 'package:buddy/widgets/Switches.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/logic/torque_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final initializeSettingsProvider = FutureProvider<void>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  ref.read(Providers().UnitsProvider.notifier).state = prefs.getBool('isMetric') ?? false;
  ref.read(Providers().threadSizeProvider.notifier).state = prefs.getBool('isCoarse') ?? false;
});


class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(initializeSettingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children:  [
           SettingsSwitch(
              userHelperText: 'Measurement Units',
              settingTitle: 'Measurement Units',
              settingOptions: ('INCH', 'METRIC'),
              provider: Providers().UnitsProvider,
            ),
          SettingsSwitch(
              userHelperText: 'Thread Type',
              settingTitle: 'Thread Type',
              settingOptions: ('COURSE', 'FINE'),
              provider: Providers().threadSizeProvider,
            ),
          SettingsSwitch(
              userHelperText: 'Work Units',
              settingTitle: 'Work Units',
              settingOptions: ('Foot-Pounds', 'Newton-Meters'),
              provider: Providers().workProvider,
            ),
        ],
      ),
    );
  }
}
