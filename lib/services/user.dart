import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsldb/models/user.dart';

class UserService {
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUser(User user) {
    return userCollection.document(user.uid).setData({
      'email': user.email,
      'userName': user.userName,
    });
  }

  Future updateUserChampion(User user) {
    return userCollection.document(user.uid).setData({'champions': user.champions});
  }

//  Stream<User> user(String uid) {
  Stream<User> get user {
    return userCollection
        .document("uid")
        .snapshots()
        .map((documentSnapshot) => User.fromDocumentSnapshot(documentSnapshot));
  }

//  Stream<List<User>> usersChampions(String uid) {
//    return userCollection.where('uid', isEqualTo: uid).snapshots().map(userListFromSnapshot);
//  }
}
