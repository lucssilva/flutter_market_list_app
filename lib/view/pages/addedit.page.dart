import 'package:flutter/material.dart';
import 'package:market_list_crud_app/utils/consts.dart';
import 'package:market_list_crud_app/view/screens/itemform.screen.dart';
import 'package:market_list_crud_app/view/widgets/actionbutton.widget.dart';
import 'package:market_list_crud_app/view/widgets/expandablefab.widget.dart';

class AddOrEditPage extends StatelessWidget {
  const AddOrEditPage({this.isEditing = false});
  final bool isEditing;

  @override
  build(_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(isEditing ? UIText.edit : UIText.add),
        ),
        body: ItemFormScreen(isEditing),
        floatingActionButton: ExpandableFabWidget(
          distance: Measurements.fabDistance,
          children: [
            ActionButtonWidget(
              onPressed: () => {},
              icon: const Icon(Icons.save_rounded),
            ),
            ActionButtonWidget(
              onPressed: () => {},
              icon: const Icon(Icons.camera_alt_rounded),
            ),
          ],
        ),
      );
}
