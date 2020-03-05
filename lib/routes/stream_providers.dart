import 'package:provider/provider.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/faction.dart';
import 'package:rsldb/models/user.dart';
import 'package:rsldb/models/user_group.dart';
import 'package:rsldb/models/wrapper.dart';
import 'package:rsldb/services/champion.dart';
import 'package:rsldb/services/faction.dart';
import 'package:rsldb/services/user.dart';
import 'package:rsldb/services/user_group.dart';

// _ = Map<String, List<String>> params
StreamProvider<User> userProvider() {
  return StreamProvider<User>.value(
    value: UserService().user,
  );
}

StreamProvider<List<UserGroup>> groupMembersProvider() {
  return StreamProvider<List<UserGroup>>.value(
    value: UserGroupService().groupMembers,
  );
}

StreamProvider<Invitations> invitationsProvider() {
  return StreamProvider<Invitations>.value(
    value: GroupService().invitations,
  );
}

StreamProvider<Group> groupProvider() {
  return StreamProvider<Group>.value(
    value: GroupService().group,
  );
}

StreamProvider<List<Event>> eventProvider() {
  return StreamProvider<List<Event>>.value(
    value: EventService().groupEvents,
  );
}

StreamProvider<List<Event>> currentEventProvider() {
  return StreamProvider<List<Event>>.value(
    value: EventService().userCurrentEvent,
  );
}

StreamProvider<Map<String, User>> userMapProvider() {
  return StreamProvider<Map<String, User>>.value(
    value: UserService().userMap,
  );
}
