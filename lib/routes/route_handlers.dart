import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/auth_user.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/routes/stream_providers.dart';
import 'package:rsldb/screens/authenticate/auth_form.dart';
import 'package:rsldb/screens/calendar/calendar_view.dart';
import 'package:rsldb/screens/chat/chat.dart';
import 'package:rsldb/screens/group/customize.dart';
import 'package:rsldb/screens/group/home.dart';
import 'package:rsldb/screens/group/members.dart';
import 'package:rsldb/screens/home/home.dart';
import 'package:rsldb/screens/user/defaults.dart';
import 'package:rsldb/screens/user/home.dart';
import 'package:rsldb/screens/user/settings.dart';
import 'package:rsldb/services/auth.dart';

final application = sl.get<AppState>();

var authHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthUser _currentUser = Provider.of<AuthUser>(context);
  if (_currentUser == null) return AuthForm();
  application.currentUserUID = _currentUser.uid;
  application.currentUserEmail = _currentUser.email;
  return MultiProvider(
    providers: [
      userProvider(),
      membershipProvider(),
    ],
    child: HomeComponent(),
  );
});

var groupHandler = Handler(handlerFunc: (BuildContext context, _) {
  return MultiProvider(
    providers: [
      currentEventProvider(),
    ],
    child: GroupHome(),
  );
});

var customizeHandler = Handler(handlerFunc: (BuildContext context, _) => CustomizeGroup());

var membersHandler = Handler(handlerFunc: (BuildContext context, _) {
  return MultiProvider(
    providers: [
      membersProvider(),
    ],
    child: GroupMembers(),
  );
});

var groupsHandler = Handler(handlerFunc: (BuildContext context, _) {
  return MultiProvider(
    providers: [
      membershipProvider(),
      invitationsProvider(),
    ],
    child: UsersHome(),
  );
});

var chatHandler = Handler(handlerFunc: (BuildContext context, _) {
  return MultiProvider(
    providers: [
      userMapProvider(),
      userProvider(),
    ],
    child: ChatScreen(),
  );
});

Handler calendarHandler(showListOnly) {
  return Handler(handlerFunc: (BuildContext context, _) {
    return MultiProvider(
      providers: [
        userMapProvider(),
        eventProvider(),
      ],
      child: CalendarView(showListOnly: showListOnly),
    );
  });
}

var defaultsHandler = Handler(handlerFunc: (BuildContext context, _) {
  return MultiProvider(
    providers: [
      userProvider(),
    ],
    child: UsersGroupDefaults(),
  );
});

var settingsHandler = Handler(handlerFunc: (BuildContext context, _) {
  return MultiProvider(
    providers: [
      userProvider(),
    ],
    child: SettingsForm(),
  );
});

var logoutHandler = Handler(handlerFunc: (BuildContext context, _) {
  AuthService().signOut();
  application.currentUserUID = null;
  application.currentUserEmail = null;
  return AuthForm();
});
