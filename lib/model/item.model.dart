class Item {
  int id;
  String name;
  double price;
  String path;

  Item({this.id, this.name, this.price, this.path});

  Map<String, dynamic> toMap() => {'name': name, 'path': path};

  factory Item.fromMap(Map<String, dynamic> map) => Item(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        path: map['path'],
      );
}
