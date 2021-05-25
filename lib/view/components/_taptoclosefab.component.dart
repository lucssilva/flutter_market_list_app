import 'package:flutter/material.dart';

class TapToCloseFabComponent extends StatelessWidget {
  const TapToCloseFabComponent({@required this.onTapToClose});
  final VoidCallback onTapToClose;

  @override
  build(_) => SizedBox(
        width: 56.0,
        height: 56.0,
        child: Center(
          child: Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            elevation: 4.0,
            child: InkWell(
              onTap: onTapToClose,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.close, color: Theme.of(_).primaryColor),
              ),
            ),
          ),
        ),
      );
}
