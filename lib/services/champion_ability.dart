import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsldb/models/champion_ability.dart';

class ChampionAbilityService {
  final CollectionReference championAbilityCollection =
      Firestore.instance.collection('champions_abilities');

  Future updateChampionsAbilities(ChampionAbility championAbility) {
    return championAbilityCollection.document(championAbility.uid).setData(championAbility.toJson);
  }

  List<ChampionAbility> championsAbilitiesListFromSnapshot(QuerySnapshot querySnapshot) =>
      querySnapshot.documents
          .map((documentSnapshot) => ChampionAbility.fromDocumentSnapshot(documentSnapshot))
          .toList();

  Stream<List<ChampionAbility>> get championsAbilities =>
      championAbilityCollection.snapshots().map(championsAbilitiesListFromSnapshot);
}
