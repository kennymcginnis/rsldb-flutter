import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsldb/models/user_champion.dart';
import 'package:rsldb/services/user.dart';

class UserChampionService {
  final UserService userService = new UserService();

  final CollectionReference userChampionCollection =
      Firestore.instance.collection('usersChampions');

  Future updateUsersChampions(UserChampion userChampion) =>
      userChampionCollection.document(userChampion.uid).setData({
        'user': userChampion.user,
        'champion': userChampion.champion,
        'acquired': userChampion.acquired,
        'rank': userChampion.rank,
        'ascension': userChampion.ascension,
        'ratings': userChampion.ratings,
      });

  Future rankChampion(String uid, int rank) =>
      userChampionCollection.document(uid).setData({'rank': rank});

  Future rateChampion(String uid, Map<String, int> ratings) =>
      userChampionCollection.document(uid).setData({'ratings': ratings});

  Future acquireChampion(String uid, String acquired) =>
      userChampionCollection.document(uid).setData({'acquired': acquired});

  Future ascendChampion(String uid, String ascension) =>
      userChampionCollection.document(uid).setData({'ascension': ascension});

  List<UserChampion> userChampionListFromSnapshot(QuerySnapshot querySnapshot) =>
      querySnapshot.documents
          .map((documentSnapshot) => UserChampion.fromDocumentSnapshot(documentSnapshot))
          .toList();

  Stream<List<UserChampion>> user(String userUID) => userChampionCollection
      .where('user', isEqualTo: userUID)
      .snapshots()
      .map(userChampionListFromSnapshot);
}
