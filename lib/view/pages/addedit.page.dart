import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_list_crud_app/controllers/camera/camera.bloc.dart';
import 'package:market_list_crud_app/controllers/items/items.bloc.dart';
import 'package:market_list_crud_app/model/item.model.dart';
import 'package:market_list_crud_app/services/camera.helper.dart';
import 'package:market_list_crud_app/utils/consts.dart';
import 'package:market_list_crud_app/view/screens/camera.screen.dart';
import 'package:market_list_crud_app/view/screens/itemform.screen.dart';
import 'package:market_list_crud_app/view/widgets/actionbutton.widget.dart';
import 'package:market_list_crud_app/view/widgets/expandablefab.widget.dart';

class AddOrEditPage extends StatefulWidget {
  const AddOrEditPage({this.isEditing = false});
  final bool isEditing;
  static const ROUTE = '/add';

  @override
  _AddOrEditPageState createState() => _AddOrEditPageState();
}

class _AddOrEditPageState extends State<AddOrEditPage> {
  String path;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  void saveItem() {
    BlocProvider.of<ItemsBloc>(context).add(
      ItemsAdded(
        item: Item(
          path: path,
          name: _nameController.text,
          price: double.parse(_priceController.text),
        ),
      ),
    );
    Navigator.of(context).pop();
  }

  void openCamera() {
    FocusScope.of(context).requestFocus(FocusNode()); //remove focus
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CameraBloc(cameraHelper: CameraHelper())
              ..add(CameraInitialized()),
            child: CameraScreen(),
          ),
        )).then((value) => setState(() => path = value));
  }

  @override
  build(_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.isEditing ? UIText.edit : UIText.add),
        ),
        body: ItemFormScreen(
          isEditing: widget.isEditing,
          nameController: _nameController,
          priceController: _priceController,
        ),
        floatingActionButton: ExpandableFabWidget(
          distance: Measurements.fabDistance,
          children: [
            ActionButtonWidget(
              onPressed: () => saveItem(),
              icon: const Icon(Icons.save_rounded),
            ),
            ActionButtonWidget(
              onPressed: () => openCamera(),
              icon: const Icon(Icons.camera_alt_rounded),
            ),
          ],
        ),
      );
}
