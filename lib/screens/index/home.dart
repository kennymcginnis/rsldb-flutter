import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rsldb/components/horizontal_divider.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/code_name.dart';
import 'package:rsldb/routes/app_state.dart';

class IndexHomeView extends StatelessWidget {
  final application = sl.get<AppState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildFactionGroupList() {
      List<Widget> output = new List<Widget>();
      for (CodeName factionGroup in application.codeNamesByType["faction_group"]) {
        output.add(HorizontalDivider(text: factionGroup.name));
        for (String factionUID in factionGroup.children) {
          CodeName faction = application.codeNameMap[factionUID];
          output.add(
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(faction.url),
              ),
              title: Text(faction.name),
              onTap: () => Navigator.pushNamed(context, 'faction/$factionUID'),
            ),
          );
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
