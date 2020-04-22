import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rsldb/components/menu_button_image.dart';
import 'package:rsldb/components/menu_button_text.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/routes/app_state.dart';

class HomeComponent extends StatelessWidget {
  final application = sl.get<AppState>();

/*
  static var httpClient = new HttpClient();
  
  // /data/user/0/com.rsl.db/app_flutter
  Future<File> _downloadFile(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
*/

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final childRatio = (size.width / size.height) * 2.5;

/*
    List<Champion> champions = Provider.of<List<Champion>>(context) ?? [];
    if (champions.length > 0) {
      champions.forEach((Champion c) {
        _downloadFile(c.avatar, c.avatar.substring(c.avatar.lastIndexOf("/")));
      });
    }
*/

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
                  MenuButtonImage(
                    image: 'assets/index.png',
                    navigateTo: '/index',
                  ),
                  MenuButtonImage(
                    image: 'assets/champions.png',
                    navigateTo: '/champions',
                  ),
                  MenuButtonText(
                    icon: Icons.settings,
                    text: 'Settings',
                    navigateTo: '/settings',
                  ),
                  MenuButtonText(
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
