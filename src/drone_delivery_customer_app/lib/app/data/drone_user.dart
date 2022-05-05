import 'package:firebase_auth/firebase_auth.dart';

class DroneUser {
  late String uid;
  late String name;
  late String email;
  late int age;
  late String phoneNumber;
  late bool isNewUser;

  DroneUser.fromFirebase(User user) {
    uid = user.uid;
    name = user.displayName ?? "";
    email = user.email ?? "";
    phoneNumber = user.phoneNumber ?? "";
    isNewUser = name.isEmpty;
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'name': name.toString(),
      'age': age.toString(),
      'phoneNumber': phoneNumber.toString(),
      'email': email.toString(),
    };
  }
}
