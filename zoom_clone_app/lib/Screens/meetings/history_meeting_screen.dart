import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone_app/Screens/resources/stores/firestore_controller.dart';

class HistoryMeetingScreen extends StatefulWidget {
  const HistoryMeetingScreen({super.key});

  @override
  State<HistoryMeetingScreen> createState() => _HistoryMeetingScreenState();
}

class _HistoryMeetingScreenState extends State<HistoryMeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("All Meeting History"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FireStoreHandler().meetingHistory,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: (snapshot.data as dynamic).docs.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Room Name: ${(snapshot.data as dynamic).docs[index]["meetingName"]}",
                      ),
                      subtitle: Text(
                        "Joined on ${DateFormat.yMMMd().format((snapshot.data as dynamic).docs[index]["createdAt"].toDate())}",
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(
                          color: Colors.blue[200],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
