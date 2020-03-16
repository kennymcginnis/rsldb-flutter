import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/auth_user.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/routes/stream_providers.dart';
import 'package:rsldb/screens/authenticate/auth_form.dart';
import 'package:rsldb/screens/home/home.dart';
import 'package:rsldb/screens/index/home.dart';
import 'package:rsldb/services/auth.dart';

final application = sl.get<AppState>();

var authHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthUser _currentUser = Provider.of<AuthUser>(context);
  if (_currentUser == null) return AuthForm();
  application.currentUserUID = _currentUser.uid;
  application.currentUserEmail = _currentUser.email;
  return MultiProvider(
    providers: [
      userProvider,
    ],
    child: HomeComponent(),
  );
});

var indexHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthUser _currentUser = Provider.of<AuthUser>(context);
  if (_currentUser == null) return AuthForm();
  return MultiProvider(
    providers: [
      codeNamesProvider,
      championsProvider,
      usersChampionsProvider,
    ],
    child: IndexComponent(),
  );
});

var logoutHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthService().signOut();
  return AuthForm();
});
