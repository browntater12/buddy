import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:buddy/logic/torque_logic.dart';
import 'package:buddy/pages/terms_and_conditions.dart';

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final initializeSettingsProvider = FutureProvider<void>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  ref.read(termsProvider.notifier).state = prefs.getBool('isTermsAccepted') ?? false;
});

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF219EBC), // Main Light Blue
        scaffoldBackgroundColor: Color(0xFFEAF6F6), // Light Background
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFB703)), // Accent (Yellow-Orange)
        textTheme: const TextTheme(
          displayLarge:
              TextStyle(color: Color(0xFF023047), fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Color(0xFF126782)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, 
            backgroundColor: Color(0xFFFB8500), // Text on Buttons
          ),
        ),
      ),
      //
      // ThemeData(
      //   useMaterial3: true,
      //   primaryColor: Colors.white,
      // ),
      home: ref.watch(termsProvider) ? MyHomePage(title: 'The Brown Lab') : const TermsConditionsScreen(),
    );
  }
}
