import 'package:flutter/material.dart';
import 'package:market_list_crud_app/utils/consts.dart';
import 'package:market_list_crud_app/view/components/expandablefab.dart';

class ExpandableFabWidget extends StatefulWidget {
  const ExpandableFabWidget({
    this.initialOpen = false,
    @required this.distance,
    @required this.children,
  });

  final bool initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  createState() => _ExpandableFabWidgetState();
}

class _ExpandableFabWidgetState extends State<ExpandableFabWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _expandAnimation;
  bool _open = false;

  @override
  initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  build(_) => SizedBox.expand(
        child: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            TapToCloseFabComponent(onTapToClose: _toggle),
            ..._buildExpandingActionButtons(),
            TapToOpenFabComponent(isOpen: _open, onTapToOpen: _toggle),
          ],
        ),
      );
  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = Measurements.fabIncrementBttAngle / (count - 1);

    for (var i = 0, angleInDegrees = Measurements.fabStartBttAngle;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        ExpandingActionButtonComponent(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }
}
