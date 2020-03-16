import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/user.dart';
import 'package:rsldb/routes/app_state.dart';

class UserService {
  final application = sl.get<AppState>();
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUser(User user) => userCollection.document(user.uid).setData({
        'email': user.email,
        'userName': user.userName,
      });

  Stream<User> get user => userCollection
      .document(application.currentUserUID)
      .snapshots()
      .map((documentSnapshot) => User.fromDocumentSnapshot(documentSnapshot));
}
