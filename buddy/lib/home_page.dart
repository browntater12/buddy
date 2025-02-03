import 'package:buddy/widgets/Slider.dart';
import 'package:flutter/material.dart';
import 'widgets/strength_button.dart';
import 'widgets/torqueCalc.dart'; // Add this import statement
import 'widgets/iOSPicker.dart';
import 'package:buddy/widgets/fasteners.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  List<String> strengths = fasteners['inch']['strengths'];
  List<Image> strengthImages = [Image.asset("assets/Bolt_Basic.png"),Image.asset("assets/Bolt_Basic.png"),Image.asset("assets/Bolt_Basic.png"),Image.asset("assets/Bolt_Basic.png")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 16, 17, 1),
      appBar: AppBar(actions: [IconButton(onPressed: (){print("settings");}, icon: Icon(Icons.settings, color: Color.fromRGBO(129, 132, 121, 1)))], title: Text("Torque Calculator", style: TextStyle(color: Color.fromRGBO(247, 247, 255, 1)),), backgroundColor:Color.fromRGBO(0, 16, 17, 1)),
      body: Column(
          children: [
            //Gap Between AppBar and Strengths
            //Strength buttons in row
            Container(
              height: 100,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top:30),
              decoration: BoxDecoration(color: Color.fromRGBO(81, 151, 225, 1), borderRadius: BorderRadius.circular(12)),
              child: 
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index){
                        return StrengthButton(title: strengths[index], image: strengthImages[index], index: index);
                      }
                  ),
            ),
            // Gap Between Strengths and Sizes
       
            // CupertinoPicker Widget - Size
            CupertinoPickerExample(), 
            //Gap Between Picker and Slider
            SizedBox(height: 40,),
            // Slider for k-factor
            SliderExample(),
            // Gap
            // Clampload and Torque 
            TorqueOutput(),
            //Gap
          ]
          ),
          bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            IconButton(onPressed: (){print("save");}, icon: Icon(Icons.bookmark_add_outlined, size: 30,)),
            IconButton(onPressed: (){print("list");}, icon: Icon(Icons.list_alt_outlined, size: 30,)),
            IconButton(onPressed: (){print("list");}, icon: Icon(Icons.shopping_cart_outlined, size: 30,)),
          ],),
        )
      ),
    );
  }
}