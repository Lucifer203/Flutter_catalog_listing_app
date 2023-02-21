import 'package:flutter/material.dart';
import 'package:flutter_cataloge/core/store.dart';
import 'package:flutter_cataloge/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field
  late CatalogeModel _catalog;

  //collection of IDs-store ids of each item
  final List<int> _itemIds = [];
  //get
  CatalogeModel get catalog => _catalog;
  //set
  set catalog(CatalogeModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
