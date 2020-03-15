import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rsldb/models/code_name.dart';
import 'package:rsldb/helpers/service_utils.dart';

class CodeNameService {
  final CollectionReference codeNameCollection = Firestore.instance.collection('codeNames');

  Future updateCodeName(CodeName codeName) {
    Map<String, dynamic> input = new Map<String, dynamic>();
    addNonNullToMap(input, 'type', codeName.type);
    addNonNullToMap(input, 'subtype', codeName.subtype);
    addNonNullToMap(input, 'name', codeName.name);
    addNonNullToMap(input, 'description', codeName.description);
    addNonNullToMap(input, 'url', codeName.url);
    addNonNullToMap(input, 'children', codeName.children);
    return codeNameCollection.document(codeName.uid).setData(input);
  }

  List<CodeName> codeNameListFromSnapshot(QuerySnapshot querySnapshot) => querySnapshot.documents
      .map((documentSnapshot) => CodeName.fromDocumentSnapshot(documentSnapshot))
      .toList();

  Map<String, CodeName> codeNameMapFromSnapshot(QuerySnapshot querySnapshot) {
    List<CodeName> codeNames = codeNameListFromSnapshot(querySnapshot);
    return {for (var v in codeNames) v.uid: v};
  }

  Stream<List<CodeName>> get codeNames =>
      codeNameCollection.snapshots().map(codeNameListFromSnapshot);

  Stream<Map<String, CodeName>> get codeNameMap =>
      codeNameCollection.snapshots().map(codeNameMapFromSnapshot);
}
