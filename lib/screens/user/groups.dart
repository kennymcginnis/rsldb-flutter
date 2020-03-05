import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/components/group_icon.dart';
import 'package:rsldb/helpers/flushbar.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/choice.dart';
import 'package:rsldb/models/faction.dart';
import 'package:rsldb/models/wrapper.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/routes/application.dart';
import 'package:rsldb/screens/group/create.dart';
import 'package:rsldb/services/faction.dart';

class UsersGroups extends StatelessWidget {
  final application = sl.get<AppState>();

  final List<Choice> choices = <Choice>[
    Choice(title: 'My Groups', icon: Icon(Icons.group)),
    Choice(title: 'My Invites', icon: Icon(Icons.person_add)),
    Choice(title: 'Create Group', icon: Icon(Icons.group_add)),
  ];

  @override
  Widget build(BuildContext context) {
    List<Group> _currentGroups = Provider.of<Membership>(context)?.membership ?? [];
    List<Group> _currentInvites = Provider.of<Invitations>(context)?.invitations ?? [];
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          bottom: TabBar(
            isScrollable: true,
            tabs: choices
                .map<Widget>((Choice choice) => Tab(text: choice.title, icon: choice.icon))
                .toList(),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: TabBarView(
            children: [
              ListView.builder(
                itemCount: _currentGroups.length,
                itemBuilder: (context, index) => _buildMembershipTile(
                  context,
                  _currentGroups[index],
                ),
              ),
              ListView.builder(
                itemCount: _currentInvites.length,
                itemBuilder: (context, index) => _buildInvitationsTile(
                  context,
                  _currentInvites[index],
                ),
              ),
              CreateGroup(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(String name) {
    return CircleAvatar(child: Text(name.substring(0, 2).toUpperCase()));
  }

  Widget _buildMembershipTile(BuildContext context, Group group) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: ListTile(
            onTap: () {
              application.currentGroup = group;
              application.currentGroupUID = group.uid;
              return Application.router.navigateTo(
                context,
                '/group',
                transition: TransitionType.fadeIn,
              );
            },
            leading: GroupIcon(group, size: Size.small),
            title: Text(group.name),
            trailing: IconButton(
              icon: Icon(
                FontAwesomeIcons.doorOpen,
                size: 20,
                color: Theme.of(context).primaryColorLight,
              ),
              onPressed: () async {
                try {
                  List<String> removed = group.members
                      .where((member) => member != application.currentUserUID)
                      .toList();
                  await GroupService().updateGroupMembers(removed);
                  FlushbarHelper(context, Status.success, 'You have left ${group.name}.').show();
                } catch (e) {
                  FlushbarHelper(context, Status.error, e.toString()).show();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInvitationsTile(BuildContext context, Group group) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        child: ListTile(
          onTap: () {},
          leading: _buildCircleAvatar(group.name),
          title: Text(group.name),
        ),
      ),
    );
  }
}
