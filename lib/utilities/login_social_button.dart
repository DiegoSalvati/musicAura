import 'package:flutter/material.dart';

class LoginSocialButton extends StatelessWidget {
  LoginSocialButton({
    this.colour,
    this.title,
    required this.onPressed,
    this.icon,
  });

  final Color? colour;
  final String? title;
  final Function() onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colour,
          elevation: 5,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            Text(
              title!,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
