import 'package:flutter_cataloge/models/cart.dart';
import 'package:flutter_cataloge/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogeModel catalog;
  late CartModel cart;
  MyStore() {
    catalog = CatalogeModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
