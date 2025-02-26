import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  final dynamic text;
  const TextBox({super.key, required this.text});
  @override
  State<TextBox> createState() => TextBoxState();
}

class TextBoxState extends State<TextBox> {
  late String _text;
  @override
  void initState() {
    super.initState();
    _text = widget.text;
  }
  void setText(String text) {
    setState(() {
      _text = text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(_text, style: const TextStyle(color: Colors.white, fontSize: 20),),
    );
  }
}
