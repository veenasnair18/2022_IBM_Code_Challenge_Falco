import 'package:firebase_auth/firebase_auth.dart';

import '../data/drone_user.dart';
import 'firebase_database.dart';

class Authentication {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future updateUserDetails(DroneUser user) async {
    try {
      await auth.currentUser!.updateDisplayName(user.name);
      await FirebaseDatabase.createNewUser(user);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future loginWithPhone(String phoneNumber,
      {required Function onComplete,
      required Function onFailed,
      required Function getCode}) async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        User? user = userCredential.user;
        if (user != null) {
          onComplete(DroneUser.fromFirebase(user));
        } else {
          onFailed("Phone Number is Invalid..!");
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        onFailed(e.message);
      },
      codeSent: (String verificationId, [int? resendToken]) async {
        getCode(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static Future verifyOTP(String smsCode, String verificationId,
      {required Function onComplete, required Function onFailed}) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        onComplete(DroneUser.fromFirebase(user));
      } else {
        onFailed("Phone Number is Invalid..!");
      }
    } catch (e) {}
  }
}
