import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({this.onPressed, @required this.icon});

  final VoidCallback onPressed;
  final Widget icon;

  @override
  build(_) => Material(
      elevation: 4.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(_).accentColor,
      child: IconTheme.merge(
        data: Theme.of(_).accentIconTheme,
        child: IconButton(onPressed: onPressed, icon: icon),
      ));
}
