import 'package:flutter/material.dart';
import 'package:zoom_clone_app/Screens/meetings/history_meeting_screen.dart';
import 'package:zoom_clone_app/Screens/meetings/meeting_screen.dart';
import 'package:zoom_clone_app/Screens/settings/setting_screen.dart';
import 'package:zoom_clone_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _initPage = 0;
  List<Widget> pages = [
    const MeetingScreen(),
    const HistoryMeetingScreen(),
    // const Text("Contacts"),
    const SettingsScrren()
  ];
  void onPageChanged(int page) {
    setState(() {
      _initPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_initPage],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _initPage,
          selectedItemColor: Colors.white,
          backgroundColor: footerColor,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: "Meet & Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: "Meetings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Settings"),
          ]),
    );
  }
}
