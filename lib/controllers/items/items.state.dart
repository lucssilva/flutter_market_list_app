part of 'items.bloc.dart';

abstract class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object> get props => [];
}

class ItemsInitial extends ItemsState {}

class ItemsLoadInProgress extends ItemsState {}

class ItemsLoadSuccess extends ItemsState {
  final List<Item> items;
  ItemsLoadSuccess({@required this.items});
}

class ItemsLoadFailure extends ItemsState {
  final String error;

  ItemsLoadFailure({this.error = "ItemsFailure"});

  @override
  List<Object> get props => [error];
}
