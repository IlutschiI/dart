import 'package:dart/model/bermuda/round.dart';

class Player {
  String name;

  bool isSelected = true;
  List<Round> rounds = List();

  Player(this.name);
}
