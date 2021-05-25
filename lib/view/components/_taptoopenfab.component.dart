import 'package:flutter/material.dart';

class TapToOpenFabComponent extends StatelessWidget {
  const TapToOpenFabComponent({
    @required this.isOpen,
    @required this.onTapToOpen,
  });
  final bool isOpen;
  final VoidCallback onTapToOpen;

  @override
  build(_) => IgnorePointer(
        ignoring: isOpen,
        child: AnimatedContainer(
          transformAlignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            isOpen ? 0.7 : 1.0,
            isOpen ? 0.7 : 1.0,
            1.0,
          ),
          duration: const Duration(milliseconds: 250),
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
          child: AnimatedOpacity(
            opacity: isOpen ? 0.0 : 1.0,
            curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
            duration: const Duration(milliseconds: 250),
            child: FloatingActionButton(
              onPressed: onTapToOpen,
              child: const Icon(Icons.more_horiz),
            ),
          ),
        ),
      );
}
