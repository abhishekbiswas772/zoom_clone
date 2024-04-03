import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreHandler {
  final FirebaseFirestore _fStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHistory => _fStore
      .collection('users')
      .doc(_auth.currentUser?.uid ?? "")
      .collection('meetings')
      .snapshots();

  void addToMeetingHistory(String meetingName) async {
    try {
      await _fStore
          .collection('users')
          .doc(_auth.currentUser?.uid ?? "")
          .collection('meetings')
          .add({"meetingName": meetingName, "createdAt": DateTime.now()});
    } catch (e) {
      print(e.toString());
    }
  }

}
