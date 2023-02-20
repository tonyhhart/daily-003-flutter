import 'package:daily_003_flutter/theme/colors.dart';
import 'package:daily_003_flutter/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:daily_003_flutter/components/workout_card.dart';
import 'package:daily_003_flutter/models/workout.dart';
import 'package:daily_003_flutter/theme/styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var level = WorkoutLevel.beginner;

  onFilterPressed(WorkoutLevel value) {
    setState(() {
      level = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        silverAppBar("Gofit"),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: UrbanistText(
                  "Morning, Tony 👋",
                  variant: UrbanistTextVariants.h3,
                ),
              ),
              const FeaturedWorkoutHeader(),
              const FeaturedWorkoutList(),
              const WorkoutHeader(),
              WorkoutFilters(level: level, onPressed: onFilterPressed),
            ],
          ),
        ),
        WorkoutList(
          level: level,
        ),
      ],
    );
  }
}

class WorkoutFilters extends StatelessWidget {
  const WorkoutFilters({
    super.key,
    required this.level,
    required this.onPressed,
  });

  final WorkoutLevel level;
  final Function(WorkoutLevel value) onPressed;

  onBeginnerPressed() {
    onPressed(WorkoutLevel.beginner);
  }

  onIntermediatePressed() {
    onPressed(WorkoutLevel.intermediate);
  }

  onAdvancedPressed() {
    onPressed(WorkoutLevel.advanced);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: WorkoutTypeButton(
              text: "Beginner",
              onPressed: onBeginnerPressed,
              active: level == WorkoutLevel.beginner,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: WorkoutTypeButton(
              text: "Intermediate",
              onPressed: onIntermediatePressed,
              active: level == WorkoutLevel.intermediate,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: WorkoutTypeButton(
              text: "Advanced",
              onPressed: onAdvancedPressed,
              active: level == WorkoutLevel.advanced,
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutHeader extends StatelessWidget {
  const WorkoutHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const UrbanistText(
            "Workout Levels",
            variant: UrbanistTextVariants.h5,
          ),
          UrbanistText(
            "See all",
            variant: UrbanistTextVariants.bodyLG,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

class FeaturedWorkoutHeader extends StatelessWidget {
  const FeaturedWorkoutHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const UrbanistText(
            "Featured Workout",
            variant: UrbanistTextVariants.h5,
          ),
          UrbanistText(
            "See all",
            variant: UrbanistTextVariants.bodyLG,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

class WorkoutTypeButton extends StatelessWidget {
  const WorkoutTypeButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.active});

  final String text;
  final bool active;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            side: BorderSide(width: 2.0, color: primaryColor),
            backgroundColor: active ? primaryColor : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
        onPressed: onPressed,
        child: UrbanistText(
          text,
          variant: UrbanistTextVariants.bodyLG,
          color: active ? white : primaryColor,
        ),
      ),
    );
  }
}

class FeaturedWorkoutList extends StatelessWidget {
  const FeaturedWorkoutList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var viewportFraction = 316 / MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
          height: 300,
          child: PageView.builder(
            padEnds: false,
            controller: PageController(viewportFraction: viewportFraction),
            itemCount: featuredWorkouts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: index == featuredWorkouts.length - 1 ? 16 : 0),
                child: WorkoutCard(
                  workout: featuredWorkouts[index],
                  featured: true,
                ),
              );
            },
          )),
    );
  }
}

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key, required this.level});

  final WorkoutLevel level;

  @override
  Widget build(BuildContext context) {
    var filteredWorkouts = workouts.where((w) => w.level == level).toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return SizedBox(
            height: 156,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: WorkoutCard(workout: filteredWorkouts[index]),
            ),
          );
        },
        childCount: filteredWorkouts.length,
      ),
    );
  }
}

var workouts = [
  Workout(
      title: "Squat Movement Exercise",
      image: "assets/workout_2.png",
      duration: 12,
      level: WorkoutLevel.beginner),
  Workout(
      title: "Full Body Stretching",
      image: "assets/workout_3.png",
      duration: 6,
      level: WorkoutLevel.advanced),
  Workout(
      title: "Yoga Women Exercise",
      image: "assets/workout_4.png",
      duration: 8,
      level: WorkoutLevel.intermediate),
  Workout(
      title: "Yoga Movement Exercise",
      image: "assets/workout_5.png",
      duration: 10,
      level: WorkoutLevel.beginner),
  Workout(
      title: "Abdominal Exercise",
      image: "assets/workout_6.png",
      duration: 5,
      level: WorkoutLevel.intermediate),
  Workout(
      title: "Squat Movement Exercise",
      image: "assets/workout_7.png",
      duration: 12,
      level: WorkoutLevel.beginner),
  Workout(
      title: "Full Body Stretching",
      image: "assets/workout_2.png",
      duration: 6,
      level: WorkoutLevel.advanced),
  Workout(
      title: "Yoga Women Exercise",
      image: "assets/workout_3.png",
      duration: 8,
      level: WorkoutLevel.intermediate),
  Workout(
      title: "Yoga Movement Exercise",
      image: "assets/workout_4.png",
      duration: 10,
      level: WorkoutLevel.beginner),
  Workout(
      title: "Abdominal Exercise",
      image: "assets/workout_5.png",
      duration: 5,
      level: WorkoutLevel.intermediate),
];

var featuredWorkouts = [
  Workout(
      title: "Yoga Movement Exercise",
      image: "assets/workout_7.png",
      duration: 10,
      level: WorkoutLevel.beginner),
  Workout(
      title: "Abdominal Exercise",
      image: "assets/workout_6.png",
      duration: 5,
      level: WorkoutLevel.intermediate),
  Workout(
      title: "Squat Movement Exercise",
      image: "assets/workout_5.png",
      duration: 12,
      level: WorkoutLevel.beginner),
  Workout(
      title: "Full Body Stretching",
      image: "assets/workout_4.png",
      duration: 6,
      level: WorkoutLevel.advanced),
];
