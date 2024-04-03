import 'package:flutter/material.dart';
import 'package:zoom_clone_app/Screens/custom/custom_buttons.dart';
import 'package:zoom_clone_app/Screens/resources/auth/auth_methods.dart';
import 'package:zoom_clone_app/Screens/resources/jetsi/jetsi_controller.dart';
import 'package:zoom_clone_app/utils/colors.dart';
import 'package:zoom_clone_app/utils/snak_bar.dart';

class MeetingJoinScreen extends StatefulWidget {
  const MeetingJoinScreen({super.key});

  @override
  State<MeetingJoinScreen> createState() => _MeetingJoinScreenState();
}

class _MeetingJoinScreenState extends State<MeetingJoinScreen> {
  final TextEditingController _roomIDcontroller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final JetsiMetingController _jitsiContoller = JetsiMetingController();
  final AuthMethods _authMethods = AuthMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  _joinMeeting(BuildContext context) {
    if (_roomIDcontroller.text.isNotEmpty && _nameController.text.isNotEmpty) {
      _jitsiContoller.createMetting(_roomIDcontroller.text, isAudioMuted,
          isVideoMuted, _nameController.text);
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = _authMethods.user?.displayName ?? "User A";
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _roomIDcontroller.dispose();
  }

  isAudioMutedFunc(bool result) {
    setState(() {
      isAudioMuted = result;
    });
  }

  isVideoMutedFunc(bool result) {
    setState(() {
      isVideoMuted = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text("Join a Meeting", style: TextStyle(fontSize: 18)),
          centerTitle: true),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              maxLines: 1,
              controller: _roomIDcontroller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Room ID",
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                  fillColor: secondaryBackgroundColor),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              maxLines: 1,
              controller: _nameController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Name",
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                  fillColor: secondaryBackgroundColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Join',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MeetingOptions(
            text: "Dont't join with Audio",
            isMuted: isAudioMuted,
            onChangedCallback: isAudioMutedFunc,
          ),
          MeetingOptions(
            text: "Dont't join with Video",
            isMuted: isVideoMuted,
            onChangedCallback: isVideoMutedFunc,
          )
        ],
      ),
    );
  }
}
