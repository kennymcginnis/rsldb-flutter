import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rsldb/helpers/service_utils.dart';

part 'champion_ability.g.dart';

@JsonSerializable()
class ChampionAbility {
  String uid;
  String champion;
  String ability;
  String location; // ie: All Battles
  String target; // ie: single/all
  String value; // ie: 2.5% vs 5%

  ChampionAbility({
    this.uid,
    this.champion,
    this.ability,
    this.location,
    this.target,
    this.value,
  });

  Map<String, dynamic> get toJson {
    Map<String, dynamic> input = new Map<String, dynamic>();
    addNonNullToMap(input, 'champion', this.champion);
    addNonNullToMap(input, 'ability', this.ability);
    addNonNullToMap(input, 'location', this.location);
    addNonNullToMap(input, 'target', this.target);
    addNonNullToMap(input, 'value', this.value);
    return input;
  }

  factory ChampionAbility.fromJson(Map<String, dynamic> json) => _$ChampionAbilityFromJson(json);

  factory ChampionAbility.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return ChampionAbility(
      uid: documentSnapshot.documentID,
      champion: documentSnapshot.data['champion'] as String,
      ability: documentSnapshot.data['ability'] as String,
      location: documentSnapshot.data['location'] as String,
      target: documentSnapshot.data['target'] as String,
      value: documentSnapshot.data['value'] as String,
    );
  }

  ChampionAbility copyWith({uid, champion, ability, location, target, value}) {
    return ChampionAbility(
      uid: uid ?? this.uid,
      champion: champion ?? this.champion,
      ability: ability ?? this.ability,
      location: location ?? this.location,
      target: target ?? this.target,
      value: value ?? this.value,
    );
  }
}
