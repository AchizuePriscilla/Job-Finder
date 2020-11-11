import 'package:flutter/material.dart';
import 'package:sca_ui/config.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.height,
      @required this.text,
      @required this.onPressed,
      @required this.buttonColor,
      @required this.textColor});

  final double height;
  final String text;
  final Function onPressed;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 30,
      textColor: Colors.white,
      color: buttonColor,
      child: Text(
        text,
        style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5.5, color: textColor),
      ),
    );
  }
}
