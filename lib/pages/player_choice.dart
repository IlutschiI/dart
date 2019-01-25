import 'dart:async';

import 'package:dart/model/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayerChoice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlayerChoiceState();
}

class _PlayerChoiceState extends State<PlayerChoice> {
  List<Player> _players = List();
  String newPlayerName = "";

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    Timer(Duration(milliseconds: 100), () => scrollController.jumpTo(scrollController.position.maxScrollExtent));
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(5),
        child: ListView(
          controller: scrollController,
          children: createPlayerWidgets(),
          shrinkWrap: true,
        ),
      ),
      bottomNavigationBar: Container(
        child: RaisedButton(
          onPressed: () {},
          child: Text("Let's go!"),
        ),
      ),
    );
  }

  List<Widget> mapPlayers() {
    return _players.map((p) {
      return Container(
        child: Row(
          children: <Widget>[
            Flexible(
              child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: p.isSelected ? Colors.green : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      p.isSelected = !p.isSelected;
                    });
                  }),
              flex: 1,
            ),
            Flexible(
              child: Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                  child: TextField(
                    controller: TextEditingController(text: p.name),
                    onChanged: (value) => p.name = value,
                  )),
              flex: 5,
              fit: FlexFit.tight,
            ),
            Flexible(
              child: IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {
                    setState(() {
                      _players.remove(p);
                    });
                  }),
              flex: 1,
            )
          ],
        ),
      );
    }).toList();
  }

  List<Widget> createPlayerWidgets() {
    List<Widget> players = mapPlayers();
    players.add(createAddingPlayer());
    return players;
  }

  Container createAddingPlayer() {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(child: IconButton(icon: Icon(Icons.person), onPressed: () {})),
          ),
          Flexible(
            child: Container(
              child: TextField(
                onChanged: (value) => newPlayerName = value,
              ),
            ),
            flex: 5,
          ),
          Flexible(
            child: Container(child: IconButton(icon: Icon(Icons.add), onPressed: addPlayer)),
          )
        ],
      ),
    );
  }

  void addPlayer() {
    setState(() {
      _players.add(new Player(newPlayerName));
    });
  }

  deletePlayer(Player p) {
    setState(() {
      _players.remove(p);
    });
  }
}
