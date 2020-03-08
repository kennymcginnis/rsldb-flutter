import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rsldb/components/square_menu_button.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/routes/app_state.dart';

class HomeComponent extends StatelessWidget {
  final application = sl.get<AppState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final childRatio = (size.width / size.height) * 2.5;
//    User _currentUser = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            UserAvatar(user: _currentUser, size: AvatarSize.small),
            SizedBox(width: 10.0),
            Text('rsldb (running late)'),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text('My Groups:', style: TextStyle(fontSize: 18.0)),
          ),
          /*
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: <Widget>[
                  GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [], // todo
                  ),
                ],
              ),
            ),
          ),
          */
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: childRatio,
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [
                  SquareMenuButton(
                    icon: Icons.group,
                    text: 'Manage Groups',
                    navigateTo: '/groups',
                  ),
                  SquareMenuButton(
                    icon: FontAwesomeIcons.calendarAlt,
                    text: 'Calendar',
                    navigateTo: '/calendar',
                  ),
                  SquareMenuButton(
                    icon: Icons.settings,
                    text: 'Settings',
                    navigateTo: '/settings',
                  ),
                  SquareMenuButton(
                    icon: Icons.exit_to_app,
                    text: 'Log Out',
                    navigateTo: '/logout',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
