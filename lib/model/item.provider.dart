import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:market_list_crud_app/services/database.helper.dart';

import 'item.model.dart';

class ItemProvider {
  Future<List<Item>> get items async {
    final results = await DBHelper.getAll("Items");
    return results.map((m) => Item.fromMap(m)).toList();
  }

  Future<String> get path async =>
      join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

  Future<int> addItem(Item item) async =>
      DBHelper.insert("Items", item.toMap());

  Future<int> deleteItem(Item item) async => DBHelper.delete("Items", item.id);
}
