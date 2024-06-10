import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loginwithfirebase/Home.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
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
          padding: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Name".text.make(),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          hintText: 'Hassan Ali',
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                    20.heightBox,
                    "Email".text.make(),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'Hassan@gmail.com',
                          hintStyle: TextStyle(fontSize: 12, color: Vx.gray400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                    20.heightBox,
                    "Password".text.make(),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            onPressed: () {
                              var username = nameController.text.trim();
                              var useremail = emailController.text.trim();
                              var userpassword =
                                  passwordController.toString().trim();

                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: useremail, password: userpassword)
                                  .then((value) => {
                                        print("UserCreated"),
                                        FirebaseFirestore.instance
                                            .collection('user')
                                            .doc()
                                            .set({
                                          'userName': username,
                                          'userEmail': useremail,
                                        }),
                                        Get.to(() => HomeScreen()),
                                        print("DataStore"),
                                      });
                            },
                            child: "Register"
                                .text
                                .size(22)
                                .color(Colors.white)
                                .make()),
                      ),
                    ),
                    30.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: "Don't Have Account Click Here".text.make(),
                    ),
                    20.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            onPressed: () {
                              Get.to(() => const Loginscreen());
                            },
                            child: "Login"
                                .text
                                .size(22)
                                .color(Colors.white)
                                .make()),
                      ),
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
