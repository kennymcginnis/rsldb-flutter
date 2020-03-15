import 'package:firebase_auth/firebase_auth.dart';
import 'package:rsldb/models/auth_user.dart';
import 'package:rsldb/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<AuthUser> get user => _auth.onAuthStateChanged.map((user) => AuthUser.fromFirebase(user));

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthUser.fromFirebase(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future createUserWithEmailAndPassword(String email, String password, {String userName}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return User.fromFirebase(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
