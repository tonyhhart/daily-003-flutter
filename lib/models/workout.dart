class Workout {
  final String title;
  final String image;
  final int duration;
  final WorkoutLevel level;

  Workout(
      {required this.title,
      required this.image,
      required this.duration,
      required this.level});

  String get levelLabel {
    switch (this.level) {
      case WorkoutLevel.beginner:
        return "Beginner";
      case WorkoutLevel.intermediate:
        return "Intermediate";
      case WorkoutLevel.advanced:
        return "Advanced";
    }
  }
}

enum WorkoutLevel { beginner, intermediate, advanced }
