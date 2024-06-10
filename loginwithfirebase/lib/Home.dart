import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loginwithfirebase/loginscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome Back"),
              ElevatedButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.offAll(() => Loginscreen());
                  },
                  icon: Icon(Icons.logout),
                  label: Text("Logout"))
            ],
          ),
        ));
  }
}
