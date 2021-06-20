import 'package:calculator/color.dart';
import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  final String num;
  final Function callback;
  const buttons({required this.num, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.33,
        height: 70.0,
        child: FlatButton(
          color: blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child:
              Text(num, style: TextStyle(fontSize: 25.0, color: Colors.white)),
          onPressed: () => callback(num),
        ),
      ),
    );
  }
}
