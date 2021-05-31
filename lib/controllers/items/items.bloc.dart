import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:market_list_crud_app/model/item.model.dart';
import 'package:market_list_crud_app/model/item.provider.dart';

part 'items.event.dart';
part 'items.state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc({@required this.provider}) : super(ItemsInitial());
  final ItemProvider provider;

  @override
  Stream<ItemsState> mapEventToState(ItemsEvent event) async* {
    if (event is ItemsLoaded)
      yield* _mapItemsLoadedToState();
    else if (event is ItemsAdded)
      yield* _mapItemsAddedToState(event);
    else if (event is ItemsDeleted) yield* _mapItemsDeletedToState(event);
  }

  Stream<ItemsState> _mapItemsLoadedToState() async* {
    yield ItemsLoadInProgress();
    try {
      final items = await provider.items;
      yield ItemsLoadSuccess(items: items);
    } on Exception catch (error) {
      yield ItemsLoadFailure(error: error.toString());
    }
  }

  Stream<ItemsState> _mapItemsAddedToState(ItemsAdded event) async* {
    if (state is ItemsLoadSuccess) {
      final items = List<Item>.from((state as ItemsLoadSuccess).items)
        ..add(event.item);
      yield ItemsLoadInProgress();
      try {
        await provider.addItem(event.item);
        yield ItemsLoadSuccess(items: items);
      } on Exception catch (error) {
        yield ItemsLoadFailure(error: error.toString());
      }
    }
  }

  Stream<ItemsState> _mapItemsDeletedToState(ItemsDeleted event) async* {
    if (state is ItemsLoadSuccess) {
      final items = List<Item>.from((state as ItemsLoadSuccess).items)
        ..remove(event.item);

      yield ItemsLoadInProgress();
      try {
        await provider.deleteItem(event.item);
        yield ItemsLoadSuccess(items: items);
      } on Exception catch (error) {
        yield ItemsLoadFailure(error: error.toString());
      }
    }
  }
}
