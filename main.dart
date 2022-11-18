import 'package:flutter/material.dart';

Widget TextFieldUi(lbltext, hnttxt, icn, obstxt) {
  return TextField(
    obscureText: obstxt,
    style: TextStyle(color: Colors.white.withOpacity(0.5)),
    decoration: InputDecoration(
      labelText: lbltext,
      fillColor: Colors.black.withOpacity(0.3),
      filled: true,
      prefixIcon: Icon(
        icn,
        color: Colors.grey.withOpacity(0.5),
      ),
      hintText: hnttxt,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
