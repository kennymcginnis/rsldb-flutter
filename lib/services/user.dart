import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsldb/models/user.dart';

class UserService {
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUser(User user) => userCollection.document(user.uid).setData({
        'email': user.email,
        'userName': user.userName,
      });

  Stream<User> user(String uid) => userCollection
      .document(uid)
      .snapshots()
      .map((documentSnapshot) => User.fromDocumentSnapshot(documentSnapshot));
}
