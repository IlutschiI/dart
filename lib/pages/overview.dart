import 'package:dart/pages/player_choice.dart';
import 'package:dart/services/page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                PageNavigator().navigateWithoutAnimation(PlayerChoice(), context);
              },
              child: Text("start new Game"),
            )
          ],
        )
      ],
    );
  }
}
