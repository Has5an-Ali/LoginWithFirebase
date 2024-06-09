import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loginwithfirebase/const/commonbg.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Register.dart';
import 'const/commontextfield.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              'Welcome Back'.text.size(22).fontWeight(FontWeight.bold).make(),
              20.heightBox,
              Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'Hassan@gmai.com',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  20.heightBox,
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
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
                            shape: const RoundedRectangleBorder(
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
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        onPressed: () {
                          Get.to(() => const RegisterScreen());
                        },
                        child:
                            "Sign up".text.size(22).color(Colors.white).make()),
                  ),
                ],
              )
            ],
          )
              .box
              .rounded
              .padding(const EdgeInsets.all(12))
              .margin(const EdgeInsets.all(8))
              .color(Colors.white)
              .width(context.screenWidth - 20)
              .make(),
        ),
      ),
    );
  }
}
