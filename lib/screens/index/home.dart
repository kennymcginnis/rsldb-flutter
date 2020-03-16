import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsldb/components/horizontal_divider.dart';
import 'package:rsldb/components/loading.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/code_name.dart';
import 'package:rsldb/models/user_champion.dart';
import 'package:rsldb/routes/app_state.dart';
import 'package:rsldb/services/code_name.dart';

class IndexComponent extends StatelessWidget {
  final application = sl.get<AppState>();

  @override
  Widget build(BuildContext context) {
    List<Champion> champions = Provider.of<List<Champion>>(context) ?? [];
    List<UserChampion> userChampionMap = Provider.of<List<UserChampion>>(context) ?? [];

    List<CodeName> codeNames = Provider.of<List<CodeName>>(context) ?? [];
    if (codeNames.length == 0) return Loading();
    Map<String, CodeName> codeNameMap = CodeNameService().codeNameMap(codeNames);
    Map<String, List<CodeName>> codeNameTypeMap = CodeNameService().codeNamesByType(codeNames);

    List<Widget> _buildFactionGroupList() {
      List<Widget> output = new List<Widget>();
      for (CodeName factionGroup in codeNameTypeMap["faction_group"]) {
        output.add(HorizontalDivider(text: factionGroup.name));
        for (String faction in factionGroup.children) {
          output.add(ListTile(title: Text(codeNameMap[faction].name)));
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
            Text('Index - All Champions'),
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
