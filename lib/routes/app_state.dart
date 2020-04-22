import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/code_name.dart';

class AppState {
  String currentUserUID;
  String currentUserEmail;

  List<CodeName> codeNames;
  Map<String, CodeName> codeNameMap;
  Map<String, List<CodeName>> codeNamesByType;

  List<Champion> champions;
  Map<String, Champion> championMap;
}
