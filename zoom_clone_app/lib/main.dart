import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zoom_clone_app/Screens/home/home_screen.dart';
import 'package:zoom_clone_app/Screens/login/login_screen.dart';
import 'package:zoom_clone_app/Screens/resources/auth/auth_methods.dart';
import 'package:zoom_clone_app/Screens/routes/routes.dart';
import 'package:zoom_clone_app/firebase_options.dart';
import 'package:zoom_clone_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google/Zoom Clone',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: StreamBuilder(
        stream: AuthMethods().getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute().getRoutesForApp,
    );
  }
}
