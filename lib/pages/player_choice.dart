import 'package:dart/model/player.dart';
import 'package:flutter/widgets.dart';

class PlayerChoice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlayerChoiceState();
}

class _PlayerChoiceState extends State<PlayerChoice> {
  List<Player> _players = List();

  @override
  Widget build(BuildContext context) {
    return ListView(children: mapPlayers());
  }

  List<Widget> mapPlayers() {
    return _players.map((p) {
      return Container(child: Text(""));
    }).toList();
  }
}
