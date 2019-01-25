import 'package:dart/model/bermuda/round.dart';

class Player {
  String name;

  bool isSelected = false;
  List<Round> rounds = List();

  Player(this.name);
}
