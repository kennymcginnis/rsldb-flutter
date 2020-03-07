import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/user.dart';
import 'package:rsldb/routes/app_state.dart';

class UserService {
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final application = sl.get<AppState>();

  Future updateUser(User user) {
    return userCollection.document(user.uid).setData({
      'email': user.email,
      'userName': user.userName,
    });
  }

  Future updateUserChampion(User user) {
    return userCollection.document(user.uid).setData({'champions': user.champions});
  }

  Stream<User> user(String user) {
    return userCollection
        .document(application.currentUserUID)
        .snapshots()
        .map((documentSnapshot) => User.fromDocumentSnapshot(documentSnapshot));
  }
}
