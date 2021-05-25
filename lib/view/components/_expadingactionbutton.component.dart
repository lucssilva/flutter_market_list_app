import 'dart:math' as math;
import 'package:flutter/material.dart';

class ExpandingActionButtonComponent extends StatelessWidget {
  ExpandingActionButtonComponent({
    @required this.child,
    @required this.directionInDegrees,
    @required this.maxDistance,
    @required this.progress,
  });
  final Widget child;
  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;

  @override
  build(_) => AnimatedBuilder(
      animation: progress,
      child: FadeTransition(opacity: progress, child: child),
      builder: (_, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );

        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child,
          ),
        );
      });
}
