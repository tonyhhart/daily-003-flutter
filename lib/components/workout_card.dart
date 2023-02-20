import 'package:flutter/material.dart';
import 'package:daily_003_flutter/models/workout.dart';
import 'package:daily_003_flutter/theme/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key, required this.workout, this.featured = false});

  final Workout workout;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: featured ? 300 : 140,
      width: featured ? 300 : null,
      child: Stack(
        children: [
          BackgroundImage(featured: featured, image: workout.image),
          BackgroundGradient(featured: featured),
          Padding(
            padding: EdgeInsets.all(featured ? 36 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UrbanistText(
                  workout.title,
                  variant: UrbanistTextVariants.h4,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    UrbanistText(
                      "${workout.duration} minutes",
                      variant: UrbanistTextVariants.bodyMD,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: UrbanistText(
                        "|",
                        variant: UrbanistTextVariants.bodyMD,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: UrbanistText(
                        workout.levelLabel,
                        variant: UrbanistTextVariants.bodyMD,
                        color: Colors.white,
                      ),
                    ),
                    SvgPicture.asset("assets/icons/header_favorites.svg",
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    super.key,
    required this.featured,
  });

  final bool featured;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(featured ? 32 : 24),
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: const [
                Color.fromARGB(0, 75, 75, 75),
                Color.fromARGB(255, 32, 32, 32),
              ],
              stops: [
                featured ? 0.3 : 0.0,
                1.0
              ])),
    );
  }
}

// (180deg, rgba(75, 75, 75, 0) 0%,
// rgba(68, 68, 68, 0.114356) 17.19%,
// rgba(64, 64, 64, 0.3) 27.08%,
// rgba(58, 58, 58, 0.4) 41.67%,
// rgba(54, 54, 54, 0.5) 52.6%,
// rgba(47, 47, 47, 0.6) 66.15%,
// rgba(40, 40, 40, 0.8) 80.21%,
// rgba(32, 32, 32, 0.9) 100%);

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.featured,
    required this.image,
  });

  final bool featured;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: featured ? 300 : 140,
      width: featured ? 300 : null,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(featured ? 32 : 24)),
    );
  }
}
