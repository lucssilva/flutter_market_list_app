abstract class Routes {
  static const HOME = '/';
  static const ADD = '/add';
}

abstract class UIText {
  UIText._();
  static String get appTitle => 'Market List App';
  static String get addTodo => 'Add Todo';
  static String get todos => 'Todos';
  static String get stats => 'Stats';
}
