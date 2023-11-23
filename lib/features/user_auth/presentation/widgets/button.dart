import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF8BC34A)
        ),
        padding: EdgeInsets.all(13),
        child: Text(

          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),
        ),
      ),
    );
  }
}
