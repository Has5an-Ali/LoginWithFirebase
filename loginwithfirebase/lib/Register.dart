import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'Home.dart';
import 'loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                'Register Your Account '
                    .text
                    .size(22)
                    .fontWeight(FontWeight.bold)
                    .make(),
                20.heightBox,
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Name".text.make(),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            hintText: 'Hassan Ali',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Vx.gray400),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      20.heightBox,
                      "Email".text.make(),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: 'Hassan@gmail.com',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Vx.gray400),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      20.heightBox,
                      "Password".text.make(),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            hintText: '*******',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Vx.gray400),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero)),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var username = nameController.text.trim();
                                var useremail = emailController.text.trim();
                                var userpassword =
                                    passwordController.text.trim();

                                try {
                                  UserCredential userCredential =
                                      await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                              email: useremail,
                                              password: userpassword);

                                  User? user = userCredential.user;

                                  if (user != null) {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user.uid)
                                        .set({
                                      'userName': username,
                                      'userEmail': useremail,
                                    });

                                    // Show success snackbar
                                    Get.snackbar(
                                      'Success',
                                      'User registered successfully',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );

                                    Get.to(() => const HomeScreen());
                                  }
                                } on FirebaseAuthException catch (e) {
                                  Get.snackbar(
                                    'Registration Failed',
                                    e.message ?? 'An unknown error occurred',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                } catch (e) {
                                  Get.snackbar(
                                    'Registration Failed',
                                    'An unknown error occurred',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                }
                              }
                            },
                            child: "Register"
                                .text
                                .size(22)
                                .color(Colors.white)
                                .make(),
                          ),
                        ),
                      ),
                      30.heightBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: "Already have an account? Click here"
                            .text
                            .make()
                            .onTap(() {
                          Get.to(() => const Loginscreen());
                        }),
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
                                .make(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
