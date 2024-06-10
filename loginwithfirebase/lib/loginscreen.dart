import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Home.dart';
import 'Register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                'Welcome Back'.text.size(22).fontWeight(FontWeight.bold).make(),
                20.heightBox,
                Column(
                  children: [
                    TextFormField(
                      controller: loginemailController,
                      decoration: const InputDecoration(
                          hintText: 'Hassan@gmai.com',
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                    20.heightBox,
                    TextFormField(
                      controller: loginpasswordController,
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
                          onPressed: () async {
                            var loginEmail = loginemailController.text.trim();

                            var loginPassword =
                                loginpasswordController.text.trim();

                            try {
                              final User? firebaseUser = (await FirebaseAuth
                                      .instance
                                      .signInWithEmailAndPassword(
                                          email: loginEmail,
                                          password: loginPassword))
                                  .user;
                              if (firebaseUser != null) {
                                Get.to(() => const HomeScreen());
                              }
                            } on FirebaseAuthException catch (e) {
                              print('Error $e');
                            }
                          },
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
                          child: "Sign up"
                              .text
                              .size(22)
                              .color(Colors.white)
                              .make()),
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
      ),
    );
  }
}
