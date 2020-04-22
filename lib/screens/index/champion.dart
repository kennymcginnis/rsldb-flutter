import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/helpers/service_utils.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/choice.dart';
import 'package:rsldb/models/user_champion.dart';
import 'package:rsldb/routes/app_state.dart';

class IndexChampionView extends StatefulWidget {
  final String champion;

  const IndexChampionView({Key key, this.champion}) : super(key: key);

  @override
  _IndexChampionViewState createState() => _IndexChampionViewState();
}

class _IndexChampionViewState extends State<IndexChampionView> {
  final application = sl.get<AppState>();

  @override
  Widget build(BuildContext context) {
    List<UserChampion> userChampions = Provider.of<List<UserChampion>>(context) ?? [];

    Champion champion = application.championMap[widget.champion];

    UserChampion userChampion;
    if (userChampions.length != 0) {
      userChampion = userChampions.firstWhere((UserChampion uc) => uc.champion == champion.uid);
    }
    if (userChampion == null) {
      userChampion = UserChampion.fromChampion(champion);
    }

    List<Choice> choices = <Choice>[
      Choice(title: '- Attributes -', icon: Icon(Icons.remove)),
      Choice(title: '- My Account -', icon: Icon(Icons.offline_bolt)),
      Choice(title: '- Ratings -', icon: Icon(Icons.directions_run)),
    ];

    Widget _buildAttributesList() {
      return Column(
        children: <Widget>[
          Image(
            image: NetworkImage(champion.image),
            width: MediaQuery.of(context).size.width,
          ),
          TabBar(
            isScrollable: true,
            tabs: choices.map<Widget>(
              (Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: choice.icon,
                );
              },
            ).toList(),
          ),
          TabBarView(
            children: [
              _buildAttributesSection(champion),
              _buildMyAccountSection(userChampion),
              _buildRatingsSection(champion, userChampion),
            ],
          ),
        ],
      );
    }

    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 10.0),
              Text(champion.name),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25),
                child: _buildAttributesList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttributesSection(Champion champion) {
    List<String> attributes = ["affinity", "faction", "rarity", "role", "fusion"];
    return DataTable(
      headingRowHeight: 10,
      columns: [
        DataColumn(label: Text('')),
        DataColumn(label: Text('')),
      ],
      rows: attributes
          .where((String test) => champion.attributes.containsKey(test))
          .map((String attribute) {
        var attributeUID = champion.attributes[attribute];
        var attributeCodeName = application.codeNameMap[attributeUID];
        if (attributeCodeName == null) print("attributeUID: $attributeUID");
        return DataRow(cells: [
          DataCell(Text(attribute.capitalize())),
          DataCell(Text(attributeCodeName.name)),
        ]);
      }),
    );
  }

  Widget _buildMyAccountSection(UserChampion userChampion) {
    return DataTable(
      headingRowHeight: 10,
      columns: [
        DataColumn(label: Text('')),
        DataColumn(label: Text('')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text("Acquired")),
          DataCell(Text(userChampion.acquired.toString())),
        ]),
        DataRow(cells: [
          DataCell(Text("Rank")),
          DataCell(Text(userChampion.rank.toString())),
        ]),
        DataRow(cells: [
          DataCell(Text("Ascension")),
          DataCell(Text(userChampion.ascension.toString())),
        ]),
      ],
    );
  }

  Widget _buildRatingsSection(Champion champion, UserChampion userChampion) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Location')),
        DataColumn(label: Text('Rating')),
        DataColumn(label: Text('Average')),
      ],
      rows: [""]
          .where((String test) => champion.attributes.containsKey(test))
          .map((String attribute) {
        var attributeUID = champion.attributes[attribute];
        var attributeCodeName = application.codeNameMap[attributeUID];
        if (attributeCodeName == null) print("attributeUID: $attributeUID");
        return DataRow(cells: [
          DataCell(Text(userChampion.acquired.toString())),
          DataCell(
            Text(userChampion.rank.toString()),
          ),
          DataCell(
            Text(userChampion.ascension.toString()),
          )
        ]);
      }).toList(),
    );
  }
}
