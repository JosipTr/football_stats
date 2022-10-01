import 'package:floor/floor.dart';

@entity
class Player {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  String surname;
  int goals = 0;
  int assists = 0;
  int yellowCards = 0;
  int redCards = 0;
  int trainingDays = 0;
  int overallTrainingDays = 0;
  int matchesPlayed = 0;
  int overallNumberOfMatches = 0;
  double playedMinutes = 0;
  bool isSelected = false;

  Player({this.id, required this.name, required this.surname});

  String getGoalPerMatch() {
    return (goals/matchesPlayed).toStringAsFixed(2);
  }

  String getGoalEfficiency() {
    return ((goals/matchesPlayed) * 100).toStringAsFixed(2);
  }

  String getTrainingEfficiency() {
    return ((trainingDays/overallTrainingDays) * 100).toStringAsFixed(2);
  }

  String getMatchesEfficiency() {
    return ((matchesPlayed/overallNumberOfMatches) * 100).toStringAsFixed(2);
  }
}