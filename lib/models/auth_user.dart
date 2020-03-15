import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String uid;
  final String email;

  AuthUser({this.uid, this.email});

  factory AuthUser.fromFirebase(FirebaseUser firebaseUser) {
    if (firebaseUser == null) return null;
    return AuthUser(uid: firebaseUser.uid, email: firebaseUser.email);
  }
}
