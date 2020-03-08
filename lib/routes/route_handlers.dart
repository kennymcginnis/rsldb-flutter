import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/auth_user.dart';
import 'package:rsldb/models/user.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/screens/authenticate/auth_form.dart';
import 'package:rsldb/screens/home/home.dart';
import 'package:rsldb/services/auth.dart';
import 'package:rsldb/services/user.dart';

final application = sl.get<AppState>();

var authHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthUser _currentUser = Provider.of<AuthUser>(context);
  if (_currentUser == null) return AuthForm();
  return MultiProvider(
    providers: [
      StreamProvider<User>.value(
        value: UserService().user // (_currentUser.uid),
      )
    ],
    child: HomeComponent(),
  );
});

var logoutHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthService().signOut();
  return AuthForm();
});
