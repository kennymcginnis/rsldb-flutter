import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/components/horizontal_divider.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/code_name.dart';
import 'package:rsldb/models/user_champion.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/services/user_champion.dart';

class IndexFactionView extends StatefulWidget {
  final String faction;

  const IndexFactionView({Key key, this.faction}) : super(key: key);

  @override
  _IndexFactionViewState createState() => _IndexFactionViewState();
}

class _IndexFactionViewState extends State<IndexFactionView> {
  final application = sl.get<AppState>();

  @override
  Widget build(BuildContext context) {
    List<UserChampion> userChampions = Provider.of<List<UserChampion>>(context) ?? [];
    Map<String, UserChampion> userChampMap = UserChampionService().usersChampionsMap(userChampions);

    List<UserChampion> factionChampions = application.champions
        .where((Champion champion) => champion.attributes['faction'] == widget.faction)
        .map((Champion champion) => userChampMap.containsKey(champion.uid)
            ? userChampMap[champion.uid]
            : UserChampion.fromChampion(champion))
        .toList();

    Map<String, List<UserChampion>> factionChampionsMap = new Map<String, List<UserChampion>>();
    for (UserChampion factionChampion in factionChampions) {
      Champion champion = application.championMap[factionChampion.champion];
      String rarity = champion.attributes['rarity'];
      if (factionChampionsMap.containsKey(rarity)) {
        factionChampionsMap[rarity].add(factionChampion);
      } else {
        factionChampionsMap[rarity] = [factionChampion];
      }
    }

    List<Widget> _buildFactionGroupList() {
      List<Widget> output = new List<Widget>();
      for (CodeName rarity in application.codeNamesByType['rarity']) {
        output.add(HorizontalDivider(text: rarity.name));
        if (factionChampionsMap.containsKey(rarity.uid)) {
          output.addAll(factionChampionsMap[rarity.uid]
              .map((UserChampion factionChampion) =>
                  ChampionListTile(application.championMap[factionChampion.champion]))
              .toList());
        }
      }
      return output;
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 10.0),
            Text(application.codeNameMap[widget.faction].name),
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
              child: ListView(children: _buildFactionGroupList()),
            ),
          )
        ],
      ),
    );
  }
}

class ChampionListTile extends StatefulWidget {
  Champion champion;

  ChampionListTile(this.champion);

  @override
  _ChampionListTileState createState() => _ChampionListTileState();
}

class _ChampionListTileState extends State<ChampionListTile> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.champion.avatar),
        ),
        title: Text(widget.champion.name),
//        onTap: () => Navigator.pushNamed(context, 'champion/${champion.uid}'),
        trailing: Row(
          children: <Widget>[
            _itemCount != 0
                ? IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => setState(() => _itemCount--),
                  )
                : Container(),
            Text(_itemCount.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() => _itemCount++),
            )
          ],
        ));
  }
}
