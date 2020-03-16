import 'package:provider/provider.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/champion_ability.dart';
import 'package:rsldb/models/code_name.dart';
import 'package:rsldb/models/user.dart';
import 'package:rsldb/models/user_champion.dart';
import 'package:rsldb/services/champion.dart';
import 'package:rsldb/services/champion_ability.dart';
import 'package:rsldb/services/code_name.dart';
import 'package:rsldb/services/user.dart';
import 'package:rsldb/services/user_champion.dart';

StreamProvider<User> get userProvider {
  return StreamProvider<User>.value(
    value: UserService().user,
  );
}

StreamProvider<List<CodeName>> get codeNamesProvider {
  return StreamProvider<List<CodeName>>.value(
    value: CodeNameService().codeNames,
  );
}

StreamProvider<List<Champion>> get championsProvider {
  return StreamProvider<List<Champion>>.value(
    value: ChampionService().champions,
  );
}

StreamProvider<List<ChampionAbility>> get championsAbilitiesProvider {
  return StreamProvider<List<ChampionAbility>>.value(
    value: ChampionAbilityService().championsAbilities,
  );
}

StreamProvider<List<UserChampion>> get usersChampionsProvider {
  return StreamProvider<List<UserChampion>>.value(
    value: UserChampionService().usersChampions,
  );
}
