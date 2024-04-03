import 'package:flutter/material.dart';
import 'package:zoom_clone_app/Screens/custom/custom_buttons.dart';
import 'package:zoom_clone_app/Screens/resources/auth/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  void performSignInUser(BuildContext context) async {
    bool result = await _authMethods.siginWithGoogle(context);
    if (result) {
      Navigator.of(context).pushReplacementNamed(
          "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Start or Join a Meeting",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38),
            child: Image.asset("assets/images/onboarding.jpg"),
          ),
          CustomButtons(
              textChild: "Google Sign In",
              callback: () {
                performSignInUser(context);
              })
        ],
      ),
    );
  }
}
