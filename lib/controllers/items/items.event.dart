part of 'items.bloc.dart';

abstract class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object> get props => [];
}

class ItemsLoaded extends ItemsEvent {}

class ItemsAdded extends ItemsEvent {
  final Item item;
  ItemsAdded({@required this.item});
}

class ItemsDeleted extends ItemsEvent {
  final Item item;
  ItemsDeleted({@required this.item});
}
