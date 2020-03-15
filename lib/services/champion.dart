import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsldb/models/champion.dart';

class ChampionService {
  final CollectionReference championCollection = Firestore.instance.collection('champions');

  Future updateChampion(Champion champion) => championCollection.document(champion.uid).setData({
        'name': champion.name,
        'attributes': champion.attributes,
      });

  List<Champion> championListFromSnapshot(QuerySnapshot querySnapshot) => querySnapshot.documents
      .map((documentSnapshot) => Champion.fromDocumentSnapshot(documentSnapshot))
      .toList();

  Map<String, Champion> championMapFromSnapshot(QuerySnapshot querySnapshot) {
    List<Champion> champions = championListFromSnapshot(querySnapshot);
    return {for (var v in champions) v.uid: v};
  }

  Stream<List<Champion>> get champions =>
      championCollection.snapshots().map(championListFromSnapshot);

  Stream<Map<String, Champion>> get championMap =>
      championCollection.snapshots().map(championMapFromSnapshot);
}
