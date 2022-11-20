import 'package:flutter/material.dart';
class ButtonNext extends StatelessWidget {
  const ButtonNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Container(child: Text('next'),),);
  }
}
