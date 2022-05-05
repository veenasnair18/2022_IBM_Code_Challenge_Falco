import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/drone_user.dart';

class FirebaseDatabase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future createNewUser(DroneUser user) async {
    try {
      await firestore.collection('users').doc(user.uid).set(user.toJSON());
      return true;
    } catch (_) {
      return false;
    }
  }
}
