import 'package:flutter/material.dart';
import 'package:market_list_crud_app/model/item.model.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({this.items = const <Item>[]});
  final List<Item> items;
  static const _CURRENCY = 'R\$';

  @override
  build(_) => ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) => ListTile(
          onTap: () {},
          // leading: Checkbox(value: true, onChanged: (_) {}),
          title: Hero(
            tag: 'heroTag$i',
            child: Container(
              width: MediaQuery.of(_).size.width,
              child: Text(items[i].name),
            ),
          ),
          subtitle: Text('$_CURRENCY ${items[i].price}'),
        ),
      );
}
