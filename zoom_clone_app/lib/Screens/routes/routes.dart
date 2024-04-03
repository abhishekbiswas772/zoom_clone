import 'package:flutter/material.dart';
import 'package:zoom_clone_app/Screens/home/home_screen.dart';
import 'package:zoom_clone_app/Screens/login/login_screen.dart';
import 'package:zoom_clone_app/Screens/meetings/meeting_join.dart';

class AppRoute {
  Route getRoutesForApp(RouteSettings config) {
    switch (config.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/video_call":
        return MaterialPageRoute(builder: (_) => const MeetingJoinScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
