import 'package:flutter/material.dart';

Widget Commonbg({required Scaffold child}) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/images/bg.png'),
    )),
    child: child,
  );
}
