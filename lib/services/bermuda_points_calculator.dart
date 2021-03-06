import 'package:dart/model/bermuda/bermuda_rounds.dart';
import 'package:dart/model/bermuda/hit.dart';
import 'package:dart/model/bermuda/round.dart';

class BermudaPointsCalculator {
  int calculatePoints(List<Round> rounds) {
    double points = 0;

    for (Round round in rounds) {
      if (round.hits.length == 3) {
        if (!round.bermudaRound.isDoubleTripleBullOrDoubleBull() && round.hits.every((hit) => hit.value != round.bermudaRound.value)) {
          points /= 2;
        } else if (round.bermudaRound == BermudaRound.DOUBLE && round.hits.every((hit) => hit.times != 2)) {
          points /= 2;
        } else if (round.bermudaRound == BermudaRound.TRIPLE && round.hits.every((hit) => hit.times != 3)) {
          points /= 2;
        } else if (round.bermudaRound == BermudaRound.BULL && round.hits.every((hit) => hit.value != 25 && hit.value != 50)) {
          points /= 2;
        } else if (round.bermudaRound == BermudaRound.DOUBLE_BULL && round.hits.every((hit) => hit.value != 50)) {
          points /= 2;
        } else {
          for (Hit hit in round.hits) {
            if (!round.bermudaRound.isDoubleTripleBullOrDoubleBull() && hit.value == round.bermudaRound.value) {
              points += hit.value * hit.times;
            }
            if (round.bermudaRound == BermudaRound.DOUBLE && hit.times == 2) {
              points += hit.value * 2;
            }
            if (round.bermudaRound == BermudaRound.TRIPLE && hit.times == 3) {
              points += hit.value * 3;
            }
            if (round.bermudaRound == BermudaRound.BULL && (hit.value == 25 || hit.value == 50)) {
              points += 25;
            }
            if (round.bermudaRound == BermudaRound.DOUBLE_BULL && hit.value == 50) {
              points += 50;
            }
          }
        }
      }
    }
    return points.ceil();
  }
}
