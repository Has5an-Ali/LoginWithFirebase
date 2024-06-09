import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextfields({
  hinttext,
}) {
  return TextFormField(
    decoration: InputDecoration(
        fillColor: Vx.gray400,
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        )),
  );
}
