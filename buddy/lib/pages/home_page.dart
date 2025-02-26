import 'package:buddy/widgets/Slider.dart';
import 'package:buddy/widgets/strengthBar.dart';
import 'package:flutter/material.dart';
import '../widgets/torqueCalc.dart'; // Add this import statement
import '../widgets/iOSPicker.dart';
import 'package:buddy/widgets/fasteners.dart';
import '../colors/colors.dart' as colors;
import 'package:buddy/pages/settings.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/pages/terms_and_conditions.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  List<String> strengths = fasteners['inch']['strengths'];
  List<Image> strengthImages = [
    Image.asset("assets/Bolt_Basic.png"),
    Image.asset("assets/Bolt_Basic.png"),
    Image.asset("assets/Bolt_Basic.png"),
    Image.asset("assets/Bolt_Basic.png")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                icon: Icon(Icons.settings, color: colors.iconColor))
          ],
          centerTitle: false,
          title: Text(
            "Torque",
            style: TextStyle(
                color: Color.fromRGBO(247, 247, 255, 1),
                fontWeight: FontWeight.bold),
          )),
      body: Column(children: [
        TorqueOutput(),
        //Gap Between AppBar and Strengths
        //Strength buttons in row

        // Gap Between Strengths and Sizes

        // CupertinoPicker Widget - Size
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: CupertinoPickerExample(),
        ),
        //Gap Between Picker and Slider
        SizedBox(
          height: 40,
        ),
        // Slider for k-factor
        SliderExample(),
        Strengthbar(),
      ]),
      bottomNavigationBar: Material(
        elevation: 10,
        child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      print("save");
                    },
                    icon: Icon(
                      Icons.bookmark_add_outlined,
                      size: 30,
                    ),
                    color: colors.iconColor,
                  ),
                  IconButton(
                      onPressed: () {
                        print("list");
                      },
                      icon: Icon(
                        Icons.list_alt_outlined,
                        size: 30,
                      ),
                      color: colors.iconColor),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsConditionsScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                      color: colors.iconColor),
                ],
              ),
            )),
      ),
    );
  }
}
