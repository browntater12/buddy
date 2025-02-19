import 'package:buddy/widgets/fasteners.dart';
import 'package:buddy/widgets/strength_button.dart';
import 'package:flutter/material.dart';


class Strengthbar extends StatelessWidget {
  Strengthbar({super.key});

  List<String> strengths = fasteners['inch']['strengths'];

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 100,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top:30, bottom:20),
              decoration: BoxDecoration(color:  Color(0xFF212023), borderRadius: BorderRadius.circular(12)),
              child: 
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: strengths.length,
                      itemBuilder: (context, index){
                        return StrengthButton(title: strengths[index], index: index);
                      }
                  ),
            );
  }
}