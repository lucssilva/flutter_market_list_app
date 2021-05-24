import 'package:flutter/material.dart';
import 'package:market_list_crud_app/utils/consts.dart';

enum Screens {
  todos,
  stats,
}

class NavBarWidget extends StatelessWidget {
  final Screens activeScreen;
  final Function(Screens) onScreenSelected;

  NavBarWidget({
    @required this.activeScreen,
    @required this.onScreenSelected,
  });

  @override
  build(_) => BottomNavigationBar(
        key: UniqueKey(),
        currentIndex: Screens.values.indexOf(activeScreen),
        onTap: (index) => onScreenSelected(Screens.values[index]),
        items: Screens.values
            .map(
              (tab) => BottomNavigationBarItem(
                label: tab == Screens.stats ? UIText.stats : UIText.todos,
                icon:
                    Icon(tab == Screens.todos ? Icons.list : Icons.show_chart),
              ),
            )
            .toList(),
      );
}
