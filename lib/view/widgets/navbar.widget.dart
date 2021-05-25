import 'package:flutter/material.dart';
import 'package:market_list_crud_app/utils/consts.dart';

enum Screens {
  list,
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
      currentIndex: Screens.values.indexOf(activeScreen),
      onTap: (index) => onScreenSelected(Screens.values[index]),
      items: Screens.values
          .map((tab) => BottomNavigationBarItem(
                label: tab == Screens.stats ? UIText.stats : UIText.list,
                icon: Icon(tab == Screens.list ? Icons.list : Icons.show_chart),
              ))
          .toList());
}
