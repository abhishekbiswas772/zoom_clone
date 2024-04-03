import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone_app/Screens/resources/auth/auth_methods.dart';
import 'package:zoom_clone_app/Screens/resources/stores/firestore_controller.dart';

class JetsiMetingController {
  final AuthMethods _authMethods = AuthMethods();
  final FireStoreHandler _fireStoreHandler = FireStoreHandler();

  void createMetting(
      String roomName, bool isAudioMuted, bool isVideoMuted, String? username) {
    try {
      var jitsiMeet = JitsiMeet();
      String name = "";
      if (username == null) {
        name = _authMethods.user?.displayName ?? "User A";
      } else {
        if (username != "") {
          name = _authMethods.user?.displayName ?? "User A";
        } else {
          name = username;
        }
      }
      var jitsiUserConstruct = JitsiMeetUserInfo(
        displayName: name,
        email: _authMethods.user?.email ?? "",
        avatar: _authMethods.user?.photoURL,
      );
      var options = JitsiMeetConferenceOptions(
          room: roomName,
          userInfo: jitsiUserConstruct,
          configOverrides: {
            "startWithAudioMuted": isAudioMuted,
            "startWithVideoMuted": isVideoMuted,
          });
      _fireStoreHandler.addToMeetingHistory(roomName);
      jitsiMeet.join(options);
    } catch (e) {
      print(e);
    }
  }
}
