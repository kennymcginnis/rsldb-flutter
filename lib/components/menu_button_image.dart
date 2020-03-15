import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rsldb/routes/application.dart';

class MenuButtonImage extends StatelessWidget {
  final String image;
  final String navigateTo;

  MenuButtonImage({this.image, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    //gets the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: FlatButton(
        color: theme.cardColor,
        highlightColor: theme.highlightColor,
        splashColor: theme.splashColor,
        child: Image.asset(image),
        onPressed: () => Application.router.navigateTo(
          context,
          navigateTo,
          transition: TransitionType.fadeIn,
        ),
      ),
    );
  }
}
