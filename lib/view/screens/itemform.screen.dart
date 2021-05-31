import 'package:flutter/material.dart';
import 'package:market_list_crud_app/utils/consts.dart';

class ItemFormScreen extends StatelessWidget {
  const ItemFormScreen({
    @required this.isEditing,
    @required this.nameController,
    @required this.priceController,
  });
  final bool isEditing;
  final TextEditingController nameController;
  final TextEditingController priceController;

  @override
  build(_) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                autofocus: !isEditing,
                controller: nameController,
                validator: Validators.title,
                decoration: InputDecoration(hintText: UIText.itemHint),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: priceController,
                decoration: InputDecoration(hintText: UIText.priceHint),
              ),
            ],
          ),
        ),
      );
}
