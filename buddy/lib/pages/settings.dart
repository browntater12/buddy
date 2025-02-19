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
  ref.read(UnitsProvider.notifier).state = prefs.getBool('isMetric') ?? false;
  ref.read(threadSizeProvider.notifier).state = prefs.getBool('isCoarse') ?? false;
});


class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(initializeSettingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children:  [
          ListTile(
            title: Text('Measurement Units: ${ref.watch(UnitsProvider) ? 'INCH' : 'METRIC'}'),
            trailing: Unit(
              onChanged: (value) async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isMetric', value);
              },
            ),
          ),
          ListTile(
           title: Text('Default Thread Size: ${ref.watch(threadSizeProvider) ? 'COURSE' : 'FINE'}'),
            trailing: ThreadSize(
              onChanged: (value) async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isCoarse', value);
                ref.read(isCourseProvider.notifier).setIsCourse(value);
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
