import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/models/auth_user.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/routes/application.dart';
import 'package:rsldb/routes/routes.dart';
import 'package:rsldb/services/auth.dart';
import 'package:rsldb/theme/theme.dart';

// This is our global ServiceLocator
GetIt sl = GetIt.instance;

void main() {
  sl.registerSingleton<AppState>(AppState(), signalsReady: true);
  initializeDateFormatting().then((_) => runApp(AppComponent()));
}

class AppComponent extends StatefulWidget {
  @override
  AppComponentState createState() => AppComponentState();
}

class AppComponentState extends State<AppComponent> {
  @override
  initState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'ringl8',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
