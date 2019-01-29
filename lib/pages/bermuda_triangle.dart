import 'package:dart/components/throw_input.dart';
import 'package:dart/model/bermuda/bermuda_rounds.dart';
import 'package:dart/model/bermuda/hit.dart';
import 'package:dart/model/bermuda/round.dart';
import 'package:dart/model/player.dart';
import 'package:dart/repository/player_repository.dart';
import 'package:dart/services/bermuda_points_calculator.dart';
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
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          child: Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  child: Text("${actualRound.value}"),
                  color: Colors.blue,
                ),
                flex: 1,
                fit: FlexFit.tight,
              ),
              Flexible(
                child: Container(
                  child: Text(activePlayer.name),
                  color: Colors.yellow,
                ),
                flex: 3,
                fit: FlexFit.tight,
              ),
              Flexible(
                child: Container(
                  child: Text("${BermudaPointsCalculator().calculatePoints(activePlayer.rounds)}"),
                  color: Colors.yellow,
                ),
                flex: 3,
                fit: FlexFit.tight,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ThrowInput(
        onInput: _addHit,
      ),
    );
  }

  _addHit(Hit hit) {
    Round round;
    bool isNewRound = false;
    bool isFirstRound = false;
    if (activePlayer.rounds.where((round) => round.hits.length != 3).isEmpty) {
      round = new Round();
      round.bermudaRound = actualRound;
      isNewRound = true;
      if (actualRound == BermudaRound.TWELVE) {
        isFirstRound = true;
      }
    } else {
      round = activePlayer.rounds.where((round) => round.hits.length != 3).first;
    }

    setState(() {
      round.hits.add(hit);
      if (isNewRound) {
        activePlayer.rounds.add(round);
      }
      if (round.hits.length == 3) {
        int playerIndex = players.indexOf(activePlayer);
        if (players.length - 1 == playerIndex) {
          activePlayer = players.first;
          actualRound = actualRound.nextRound;
        } else {
          activePlayer = players[playerIndex + 1];
        }
      }
    });
  }

  @override
  void initState() {
    actualRound = BermudaRound.TWELVE;
    players = PlayerRepository().players;
    activePlayer = players.first;
  }
}
