import 'package:flutter/material.dart';
import 'package:zoomclone_app/utils/colors.dart';

class CustomButton extends StatelessWidget {


  const CustomButton({super.key,required this.text,required this.onPressed,});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed:onPressed,
        child: Text(text, style: const TextStyle(
          fontSize: 17,
        ),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: buttonColor),
          )
        ),
      ),
    );
  }
}