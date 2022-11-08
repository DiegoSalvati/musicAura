import 'package:com/utilities/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.colour, this.title, required this.onPressed});

  final Color? colour;
  final String? title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colour,
          elevation: 5,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
