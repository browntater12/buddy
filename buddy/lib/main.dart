import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: MyHomePage(title: 'The Brown Lab'),
    );
  }
}
