import 'package:dart/model/player.dart';

class PlayerRepository {
  static final PlayerRepository _playerRepository = PlayerRepository._internal();

  List<Player> players;

  factory PlayerRepository() {
    return _playerRepository;
  }

  PlayerRepository._internal();
}
