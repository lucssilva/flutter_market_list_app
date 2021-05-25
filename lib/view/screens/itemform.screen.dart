import 'package:flutter/material.dart';
import 'package:market_list_crud_app/utils/consts.dart';

class ItemFormScreen extends StatelessWidget {
  const ItemFormScreen(this.isEditing);
  final bool isEditing;

  @override
  build(_) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                autofocus: !isEditing,
                validator: Validators.title,
                decoration: InputDecoration(hintText: UIText.itemHint),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: UIText.priceHint),
              ),
            ],
          ),
        ),
      );
}
