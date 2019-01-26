import 'package:dart/model/bermuda/bermuda_rounds.dart';
import 'package:dart/model/player.dart';
import 'package:dart/repository/player_repository.dart';
import 'package:flutter/material.dart';

class BermudaTriangle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BermudaTriangleState();
}

class _BermudaTriangleState extends State<BermudaTriangle> {
  BermudaRound actualRound;
  List<Player> players;
  Player activePlayer;

  @override
  Widget build(BuildContext context) {
    Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: Text(actualRound.value),
            flex: 1,
          ),
          Flexible(
            child: Text(activePlayer.name),
            flex: 3,
          )
        ],
      ),
    );

    // TODO: implement build
    return null;
  }

  @override
  void initState() {
    actualRound = BermudaRound.TWELVE;
    players = PlayerRepository().players;
    activePlayer = players.first;
  }
}
