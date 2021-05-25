abstract class Routes {
  static const INDEX = '/';
  static const ADD = '/add';
}

abstract class UIText {
  UIText._();
  static String get appTitle => 'Market List App';
  static String get add => 'Add Item';
  static String get edit => 'Edit Item';
  static String get save => 'Save Changes';
  static String get list => 'List';
  static String get stats => 'Stats';
  static String get itemHint => 'What do we need to buy?';
  static String get priceHint => 'Do you know the price?';
}

abstract class Validators {
  Validators._();
  static String title(String str) =>
      str.trim().isEmpty ? 'Please enter some text' : null;
}

abstract class Measurements {
  static double get fabDistance => 82.0;
  static double get fabStartBttAngle => 25.0;
  static double get fabIncrementBttAngle => 65.0;
}
