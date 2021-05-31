import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_list_crud_app/controllers/items/items.bloc.dart';
import 'package:market_list_crud_app/utils/consts.dart';
import 'package:market_list_crud_app/view/pages/addedit.page.dart';
import 'package:market_list_crud_app/view/screens/items.screen.dart';

class IndexPage extends StatelessWidget {
  static const ROUTE = '/';

  @override
  build(_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(UIText.appTitle),
          actions: [],
        ),
        body: BlocBuilder<ItemsBloc, ItemsState>(builder: (context, state) {
          if (state is ItemsLoadInProgress)
            return Center(child: CircularProgressIndicator());
          else if (state is ItemsLoadSuccess)
            return ItemsScreen(items: state.items);
          else if (state is ItemsLoadFailure)
            return Container(
                color: Colors.grey,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error),
                      Container(child: Text(state.error)),
                    ]));
          return Container();
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(_, AddOrEditPage.ROUTE),
          child: Icon(Icons.add),
          tooltip: UIText.add,
        ),
      );
}
