import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              'Register Your Account '
                  .text
                  .size(22)
                  .fontWeight(FontWeight.bold)
                  .make(),
              20.heightBox,
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Hassan Ali',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  20.heightBox,
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Hassan@gmai.com',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  20.heightBox,
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: '*******',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  20.heightBox,
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        onPressed: () {},
                        child:
                            "Login".text.size(22).color(Colors.white).make()),
                  ),
                  30.heightBox,
                  "Don't Have Account Click Here".text.make(),
                  20.heightBox,
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        onPressed: () {},
                        child:
                            "Sign up".text.size(22).color(Colors.white).make()),
                  ),
                ],
              )
            ],
          )
              .box
              .rounded
              .padding(EdgeInsets.all(12))
              .margin(EdgeInsets.all(8))
              .color(Colors.white)
              .width(context.screenWidth - 20)
              .make(),
        ),
      ),
    );
  }
}
