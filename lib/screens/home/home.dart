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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Used for removing back button.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 10.0),
            Text('RAID Shadow Legends Database'),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
