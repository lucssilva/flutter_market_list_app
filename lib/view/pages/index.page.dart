import 'package:flutter/material.dart';
import 'package:market_list_crud_app/utils/consts.dart';
import 'package:market_list_crud_app/view/screens/task.screen.dart';
import 'package:market_list_crud_app/view/widgets/navbar.widget.dart';

class IndexPage extends StatelessWidget {
  @override
  build(_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(UIText.appTitle),
          actions: [],
        ),
        body: TaskScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(_, Routes.ADD),
          child: Icon(Icons.add),
          tooltip: UIText.addTodo,
        ),
        bottomNavigationBar: NavBarWidget(
          activeScreen: Screens.todos,
          onScreenSelected: (tab) {},
        ),
      );
}
