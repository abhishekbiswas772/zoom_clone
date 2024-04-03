import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone_app/Screens/custom/custom_buttons.dart';
import 'package:zoom_clone_app/Screens/resources/jetsi/jetsi_controller.dart';
import 'package:zoom_clone_app/utils/colors.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  // ignore: non_constant_identifier_names
  final JetsiMetingController _jitsi_controller = JetsiMetingController();

  createNewMeeting() async {
    var randomUID = (Random().nextInt(100000000) + 10000000).toString();
    _jitsi_controller.createMetting(randomUID, true, true, null);
  }

  joinMeeting(BuildContext context) {
    Navigator.of(context).pushNamed("/video_call");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Meet and Chat"),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: const Offset(5, 0),
                  child: HomeCustomButton(
                      text: "New Meeting",
                      icon: Icons.videocam,
                      onPressed: () {
                        createNewMeeting();
                      }),
                ),
                const Spacer(),
                HomeCustomButton(
                    text: "Join Meeting",
                    icon: Icons.add_box_rounded,
                    onPressed: () {
                      joinMeeting(context);
                    }),
                const Spacer(),
                HomeCustomButton(
                    text: "Schedule",
                    icon: Icons.calendar_today,
                    onPressed: () {}),
                const Spacer(),
                HomeCustomButton(
                    text: "Share Screen",
                    icon: Icons.arrow_upward_rounded,
                    onPressed: () {})
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Create/Join Meeting with just a click",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
