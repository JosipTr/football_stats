import 'package:floor/floor.dart';

@entity
class Player {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  String surname;
  int? goals;
  int? assists;
  int? yellowCards;
  int? redCards;
  int? trainingDays;
  int? overallTrainingDays;
  int? matchesPlayed;
  int? overallNumberOfMatches;
  double? playedMinutes;
  bool isSelected = false;

  Player({this.id, required this.name, required this.surname, this.goals, this.assists, this.matchesPlayed, this.overallNumberOfMatches, this.overallTrainingDays, this.playedMinutes, this.redCards, this.trainingDays, this.yellowCards});

  String getGoalPerMatch() {
    if (goals == 0 || goals == null || matchesPlayed == 0 || matchesPlayed == null) {
      return '0';
    }
    return (goals!/matchesPlayed!).toStringAsFixed(2);
  }

  String getGoalEfficiency() {
    if (goals == 0 || goals == null || matchesPlayed == 0 || matchesPlayed == null) {
      return '0';
    }
    return ((goals!/matchesPlayed!) * 100).toStringAsFixed(2);
  }

  String getTrainingEfficiency() {
    if (trainingDays == 0 || trainingDays == null || overallTrainingDays == 0 || overallTrainingDays == null) {
      return '0';
    }
    return ((trainingDays!/overallTrainingDays!) * 100).toStringAsFixed(2);
  }

  String getMatchesEfficiency() {
    if (matchesPlayed == 0 || matchesPlayed == null || overallNumberOfMatches == 0 || overallNumberOfMatches == null) {
      return '0';
    }
    return ((matchesPlayed!/overallNumberOfMatches!) * 100).toStringAsFixed(2);
  }
}

// import 'package:floor/floor.dart';

// @entity
// class Player {
//   @PrimaryKey(autoGenerate: true)
//   int? id;
//   String name;
//   String surname;
//   int? goals;
//   int? assists;
//   int? yellowCards;
//   int? redCards;
//   int? trainingDays;
//   int? overallTrainingDays;
//   int? matchesPlayed;
//   int? overallNumberOfMatches;
//   double? playedMinutes;
//   bool isSelected = false;

//   Player({this.id, required this.name, required this.surname, this.goals, this.assists, this.matchesPlayed, this.overallNumberOfMatches, this.overallTrainingDays, this.playedMinutes, this.redCards, this.trainingDays, this.yellowCards});

//   String getGoalPerMatch() {
//     if (goals == 0 || goals == null || matchesPlayed == 0 || matchesPlayed == null) {
//       return '0';
//     }
//     return (goals!/matchesPlayed!).toStringAsFixed(2);
//   }

//   String getGoalEfficiency() {
//     if (goals == 0 || goals == null || matchesPlayed == 0 || matchesPlayed == null) {
//       return '0';
//     }
//     return ((goals!/matchesPlayed!) * 100).toStringAsFixed(2);
//   }

//   String getTrainingEfficiency() {
//     if (trainingDays == 0 || trainingDays == null || overallTrainingDays == 0 || overallTrainingDays == null) {
//       return '0';
//     }
//     return ((trainingDays!/overallTrainingDays!) * 100).toStringAsFixed(2);
//   }

//   String getMatchesEfficiency() {
//     if (matchesPlayed == 0 || matchesPlayed == null || overallNumberOfMatches == 0 || overallNumberOfMatches == null) {
//       return '0';
//     }
//     return ((matchesPlayed!/overallNumberOfMatches!) * 100).toStringAsFixed(2);
//   }
// }