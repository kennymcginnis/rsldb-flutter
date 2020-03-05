import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ratings.g.dart';

@JsonSerializable()
class Ratings {
  final String uid;

  // Grinding
  final int campaign;
  final int arenaDefense;
  final int arenaOffense;
  final int clanBoss;
  final int factionWars;

  // Dungeons
  final int minotaursLabyrinth;
  final int spidersDen;
  final int fireKnightsCastle;
  final int dragonsLair;
  final int iceGolemsPeak;

  // Potion
  final int voidKeep;
  final int forceKeep;
  final int spiritKeep;
  final int magicKeep;

  Ratings({
    this.uid,
    this.campaign,
    this.arenaDefense,
    this.arenaOffense,
    this.clanBoss,
    this.factionWars,
    this.minotaursLabyrinth,
    this.spidersDen,
    this.fireKnightsCastle,
    this.dragonsLair,
    this.iceGolemsPeak,
    this.voidKeep,
    this.forceKeep,
    this.spiritKeep,
    this.magicKeep,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) => _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);

  factory Ratings.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Ratings(
      uid: documentSnapshot.documentID,
      campaign: documentSnapshot.data['campaign'] as int,
      arenaDefense: documentSnapshot.data['arenaDefense'] as int,
      arenaOffense: documentSnapshot.data['arenaOffense'] as int,
      clanBoss: documentSnapshot.data['clanBoss'] as int,
      factionWars: documentSnapshot.data['factionWars'] as int,
      minotaursLabyrinth: documentSnapshot.data['minotaursLabyrinth'] as int,
      spidersDen: documentSnapshot.data['spidersDen'] as int,
      fireKnightsCastle: documentSnapshot.data['fireKnightsCastle'] as int,
      dragonsLair: documentSnapshot.data['dragonsLair'] as int,
      iceGolemsPeak: documentSnapshot.data['iceGolemsPeak'] as int,
      voidKeep: documentSnapshot.data['voidKeep'] as int,
      forceKeep: documentSnapshot.data['forceKeep'] as int,
      spiritKeep: documentSnapshot.data['spiritKeep'] as int,
      magicKeep: documentSnapshot.data['magicKeep'] as int,
    );
  }

  Ratings copyWith(Ratings ratings) {
    return Ratings(
      uid: ratings.uid ?? this.uid,
      campaign: ratings.campaign ?? this.campaign,
      arenaDefense: ratings.arenaDefense ?? this.arenaDefense,
      arenaOffense: ratings.arenaOffense ?? this.arenaOffense,
      clanBoss: ratings.clanBoss ?? this.clanBoss,
      factionWars: ratings.factionWars ?? this.factionWars,
      minotaursLabyrinth: ratings.minotaursLabyrinth ?? this.minotaursLabyrinth,
      spidersDen: ratings.spidersDen ?? this.spidersDen,
      fireKnightsCastle: ratings.fireKnightsCastle ?? this.fireKnightsCastle,
      dragonsLair: ratings.dragonsLair ?? this.dragonsLair,
      iceGolemsPeak: ratings.iceGolemsPeak ?? this.iceGolemsPeak,
      voidKeep: ratings.voidKeep ?? this.voidKeep,
      forceKeep: ratings.forceKeep ?? this.forceKeep,
      spiritKeep: ratings.spiritKeep ?? this.spiritKeep,
      magicKeep: ratings.magicKeep ?? this.magicKeep,
    );
  }
}
