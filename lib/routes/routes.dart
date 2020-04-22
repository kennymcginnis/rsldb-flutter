import 'package:fluro/fluro.dart';
import 'package:rsldb/routes/route_handlers.dart';

class Routes {
  static String root = '/';
  static String index = '/index';
  static String faction = '/faction/:faction';
  static String champion = '/champion/:champion';
  static String logout = '/logout';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc: (context, _) {
      print("ROUTE WAS NOT FOUND!!!");
      return null;
    });
    router.define(root, handler: authHandler);
    router.define(index, handler: indexHandler);
    router.define(faction, handler: factionHandler);
    router.define(champion, handler: championHandler);
    router.define(logout, handler: logoutHandler);
  }
}
