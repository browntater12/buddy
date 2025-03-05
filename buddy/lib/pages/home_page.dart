import 'package:buddy/pages/saved.dart';
import 'package:buddy/widgets/Slider.dart';
import 'package:buddy/widgets/strengthBar.dart';
import 'package:flutter/material.dart';
import '../widgets/torqueOutput.dart'; // Add this import statement
import '../widgets/iOSPicker.dart';
import 'package:buddy/data/fasteners.dart';
import '../colors/colors.dart' as colors;
import 'package:buddy/pages/settings.dart';
import 'package:buddy/pages/terms_and_conditions.dart';
import 'package:buddy/data/local_db_helper.dart';
import 'package:buddy/widgets/SaveData.dart';

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
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: CupertinoPickerExample(),
        ),
        SizedBox(
          height: 40,
        ),
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
                  SaveData(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SavedScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.menu_outlined,
                        size: 30,
                      ),
                      color: colors.iconColor),
                  //Buy this bolt 
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => SavedScreen()),
                  //       );
                  //     },
                  //     icon: const Icon(
                  //       Icons.shopping_cart_outlined,
                  //       size: 30,
                  //     ),
                  //     color: colors.iconColor),
                ],
              ),
            )),
      ),
    );
  }
}
