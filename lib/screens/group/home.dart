import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/components/group_icon.dart';
import 'package:rsldb/components/loading.dart';
import 'package:rsldb/components/square_menu_button.dart';
import 'package:rsldb/helpers/color_helpers.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/choice.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/faction.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/screens/calendar/styles.dart';
import 'package:rsldb/services/champion.dart';
import 'package:rsldb/services/faction.dart';

class GroupHome extends StatelessWidget {
  final application = sl.get<AppState>();
  final formatter = new DateFormat('yyyy-MM-dd');

  final List<Choice> choices = <Choice>[
    Choice(title: "I'm off today.", status: RED),
    Choice(title: 'rsldb (running late)', status: YELLOW),
    Choice(title: "I'm good to go!", status: GREEN),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final childRatio = (size.width / size.height) * 2.5;
    List<Event> _currentEvents = Provider.of<List<Event>>(context);
    Event _currentEvent =
        _currentEvents != null && _currentEvents.isNotEmpty ? _currentEvents.first : null;
    return StreamBuilder<Group>(
      stream: GroupService().group,
      builder: (BuildContext context, AsyncSnapshot<Group> snapshot) {
        if (!snapshot.hasData) return Loading();
        application.currentGroup = snapshot.data;
        application.currentGroupUID = snapshot.data.uid;
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                GroupIcon(application.currentGroup, size: Size.small),
                SizedBox(width: 10.0),
                Text(application.currentGroup.name),
              ],
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                    children: choices
                        .map((choice) => _buildStatusButton(
                              context,
                              choice,
                              _currentEvent,
                            ))
                        .toList()),
                GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: childRatio,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: [
                    SquareMenuButton(
                      icon: FontAwesomeIcons.calendarDay,
                      text: "Today's Summary",
                      navigateTo: '/today',
                    ),
                    SquareMenuButton(
                      icon: Icons.chat,
                      text: 'Group Chat',
                      navigateTo: '/chat',
                    ),
                    SquareMenuButton(
                      icon: Icons.group,
                      text: 'Group Membership',
                      navigateTo: '/members',
                    ),
                    SquareMenuButton(
                      icon: FontAwesomeIcons.cogs,
                      text: 'Customize Group',
                      navigateTo: '/customize',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusButton(BuildContext context, Choice choice, Event _currentEvent) {
    ThemeData theme = Theme.of(context);
    var isSelected = _currentEvent?.status == choice.status;
    var backgroundColor = isSelected ? ICON_COLOR[choice.status] : theme.cardColor;
    var foregroundColor = ColorHelpers.blackOrWhiteContrastColor(backgroundColor);
    var iconColor = isSelected ? foregroundColor : ICON_COLOR[choice.status];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      height: 60.0,
      child: FlatButton(
        color: backgroundColor,
        highlightColor: theme.highlightColor,
        splashColor: theme.splashColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 10.0),
            Icon(
              ICON[choice.status],
              size: 36,
              color: iconColor,
            ),
            SizedBox(width: 20.0),
            Text(
              choice.title,
              style: TextStyle(color: foregroundColor),
              textScaleFactor: isSelected ? 1.3 : 1,
            ),
          ],
        ),
        onPressed: () => EventService(uid: _currentEvent?.uid).updateEvent(new Event(
          user: application.currentUserUID,
          status: choice.status,
          dateTime: formatter.format(DateTime.now()),
        )),
      ),
    );
  }
}
