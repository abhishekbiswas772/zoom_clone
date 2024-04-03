import 'package:flutter/material.dart';
import 'package:zoom_clone_app/Screens/custom/custom_buttons.dart';
import 'package:zoom_clone_app/Screens/resources/auth/auth_methods.dart';

class SettingsScrren extends StatefulWidget {
  const SettingsScrren({super.key});

  @override
  State<SettingsScrren> createState() => _SettingsScrrenState();
}

class _SettingsScrrenState extends State<SettingsScrren> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Settings", style: TextStyle(fontSize: 17)),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomButtons(
                  textChild: "Log Out",
                  callback: () {
                    _authMethods.performSignOut();
                    Navigator.of(context).popAndPushNamed("/");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
