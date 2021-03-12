import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RecommendationRage extends StatefulWidget {
  @override
  _RecommendationRageState createState() => _RecommendationRageState();
}

class _RecommendationRageState extends State<RecommendationRage> {
  List<Recommendation> _steps;

  @override
  void initState() {
    _steps = _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF51C8FA),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: const Color(0xFF51C8FA).withOpacity(0.2),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: <Widget>[
                  _Header(),
                  Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[_TimelineSteps(steps: _steps)],
                    ),
                  ),
                  _error()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Recommendation> _generateData() {
    return <Recommendation>[
      const Recommendation(
        step: 1,
        title: 'Nutrition',
        message:
            'As a general rule of thumb, our practice recommends a sensible, whole-food approach, including lots of vegetables!',
      ),
      const Recommendation(
        step: 2,
        title: 'Physical Activity',
        message:
            '30-45 minutes on most days will help to regulate your hormones and mood, balancing your system and keeping your muscles loose.',
      ),
      const Recommendation(
        step: 3,
        title: 'Stress Reduction',
        message:
            'Yoga, meditation and walking are just some of the great ways you can learn to relieve your anxiety and stress.',
      ),
      const Recommendation(
        step: 4,
        title: 'Sleep',
        message:
            'We recommend making it a priority to get 7-8 hours of restful, uninterrupted sleep most nights.',
      ),
      const Recommendation(
        step: 5,
        title: 'Water Intake',
        message:
            'Bone broth, broth-based soups and foods with higher water content such as celery, tomatoes or melon can contribute to your daily goal!',
      ),
      const Recommendation(
        step: 6,
        title: 'Preventative Care',
        message:
            'First and Foremost, we recommend visiting us once a year for an Annual Physical (with potential routine bloodwork to monitor changes).',
      ),
      const Recommendation(
        step: 7,
        title: 'Limiting Excess Consumption or Exposure',
        message:
            'Red Meat, Caffeine, Nicotine, Alcohol, Sugar, Sunlight, Chemicals in the Workplace. (More detailed information coming soon, since in specific situations, some may have benefits in small quantities)',
      ),
    ];
  }

  Widget _error() {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF7E7E7E),
          borderRadius: new BorderRadius.circular(36.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
        ));
  }
}

class _TimelineSteps extends StatelessWidget {
  const _TimelineSteps({Key key, this.steps}) : super(key: key);

  final List<Recommendation> steps;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isOdd)
            return const TimelineDivider(
              color: Color(0xFF7E7E7E),
              thickness: 5,
              begin: 0.1,
              end: 0.9,
            );

          final int itemIndex = index ~/ 2;
          final Recommendation step = steps[itemIndex];

          final bool isLeftAlign = itemIndex.isEven;

          final child = _TimelineStepsChild(
            title: step.title,
            subtitle: step.message,
            isLeftAlign: isLeftAlign,
          );

          final isFirst = itemIndex == 0;
          final isLast = itemIndex == steps.length - 1;
          double indicatorY;
          if (isFirst) {
            indicatorY = 0.2;
          } else if (isLast) {
            indicatorY = 0.8;
          } else {
            indicatorY = 0.5;
          }

          return TimelineTile(
            alignment: TimelineAlign.manual,
            endChild: isLeftAlign ? child : null,
            startChild: isLeftAlign ? null : child,
            lineXY: isLeftAlign ? 0.1 : 0.9,
            isFirst: isFirst,
            isLast: isLast,
            indicatorStyle: IndicatorStyle(
              width: 40,
              height: 40,
              indicatorXY: indicatorY,
              indicator: _TimelineStepIndicator(step: '${step.step}'),
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF7E7E7E),
              thickness: 5,
            ),
          );
        },
        childCount: max(0, steps.length * 2 - 1),
      ),
    );
  }
}

class _TimelineStepIndicator extends StatelessWidget {
  const _TimelineStepIndicator({Key key, this.step}) : super(key: key);

  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF7E7E7E),
      ),
      child: Center(
        child: Text(
          step,
          style: GoogleFonts.roboto(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _TimelineStepsChild extends StatelessWidget {
  const _TimelineStepsChild({
    Key key,
    this.title,
    this.subtitle,
    this.isLeftAlign,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isLeftAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isLeftAlign
          ? const EdgeInsets.only(right: 32, top: 16, bottom: 16, left: 10)
          : const EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment:
            isLeftAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.roboto(
              fontSize: 22,
              color: const Color(0xFF7E7E7E),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: const Color(0xFF7E7E7E),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Personal recommendations',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 26,
                color: const Color(0xFF7E7E7E),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              child: Image.asset('assets/logo.png',
                  width: 100, height: 100, fit: BoxFit.fill))
        ],
      ),
    );
  }
}

class Recommendation {
  const Recommendation({
    this.step,
    this.title,
    this.message,
  });

  final int step;
  final String title;
  final String message;
}
