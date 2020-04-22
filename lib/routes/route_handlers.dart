import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/components/loading.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/auth_user.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/code_name.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/routes/stream_providers.dart';
import 'package:rsldb/screens/authenticate/auth_form.dart';
import 'package:rsldb/screens/home/home.dart';
import 'package:rsldb/screens/index/champion.dart';
import 'package:rsldb/screens/index/faction.dart';
import 'package:rsldb/screens/index/home.dart';
import 'package:rsldb/services/auth.dart';
import 'package:rsldb/services/champion.dart';
import 'package:rsldb/services/code_name.dart';

final application = sl.get<AppState>();

void setAppState(AuthUser _currentUser, List<CodeName> _codeNames, List<Champion> _champions) {
  setCurrentUser(_currentUser);
  setCodeNames(_codeNames);
  setChampions(_champions);
}

void setCurrentUser(AuthUser _currentUser) {
  application.currentUserUID = _currentUser.uid;
  application.currentUserEmail = _currentUser.email;
}

void setCodeNames(List<CodeName> _codeNames) {
  application.codeNames = _codeNames;
  application.codeNameMap = CodeNameService().codeNameMap(_codeNames);
  application.codeNamesByType = CodeNameService().codeNamesByType(_codeNames);
}

void setChampions(List<Champion> _champions) {
  application.champions = _champions;
  application.championMap = ChampionService().championMap(_champions);
}

var authHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthUser _currentUser = Provider.of<AuthUser>(context);
  List<CodeName> _codeNames = Provider.of<List<CodeName>>(context) ?? [];
  List<Champion> _champions = Provider.of<List<Champion>>(context) ?? [];
  if (_currentUser == null) return AuthForm();
  if (_codeNames.length == 0 || _champions.length == 0) return Loading();
  setAppState(_currentUser, _codeNames, _champions);
  return MultiProvider(
    providers: [
      userProvider,
    ],
    child: HomeComponent(),
  );
});

var indexHandler = Handler(handlerFunc: (BuildContext context, _) {
  return MultiProvider(
    providers: [
      codeNamesProvider,
    ],
    child: IndexHomeView(),
  );
});

var factionHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MultiProvider(
    providers: [
      usersChampionsProvider,
    ],
    child: IndexFactionView(faction: params['faction'].first),
  );
});

var championHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MultiProvider(
    providers: [
      usersChampionsProvider,
    ],
    child: IndexChampionView(champion: params['champion'].first),
  );
});

var logoutHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthService().signOut();
  return AuthForm();
});
