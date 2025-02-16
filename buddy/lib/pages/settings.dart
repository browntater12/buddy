import 'package:flutter/material.dart';
import 'package:buddy/widgets/Switches.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/logic/torque_logic.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children:  [
          ListTile(
            title: Text('Measurement Units: ${ref.watch(UnitsProvider) ? 'INCH' : 'METRIC'}'),
            trailing: const Unit(),
          ),
          ListTile(
           title: Text('Default Thread Size: ${ref.watch(threadSizeProvider) ? 'COURSE' : 'FINE'}'),
            trailing: ThreadSize(),
          ),
          ListTile(
            title: const Text('Temperature Units'),
          ),
          
        ],
      ),
    );
  }
}
