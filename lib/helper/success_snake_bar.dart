import 'package:flutter/material.dart';

void successSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xfff15a3d),
        ),
      ),
    ),
  );
}
