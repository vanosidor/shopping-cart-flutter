import 'package:mobx/mobx.dart';

import '../models/catalog.dart';

part 'cart_store.g.dart';

class CartStore extends _CartStore with _$CartStore {
  CartStore(CatalogModel catalog) : super(catalog);
}

abstract class _CartStore with Store {
  final CatalogModel catalog;

  _CartStore(this.catalog);

  @observable
  ObservableList<Item> itemsInCart = ObservableList.of([]);

  @computed
  int get totalPrice => itemsInCart.fold(
      0, (previousValue, element) => previousValue + element.price);

  @action
  void add(Item item) {
    itemsInCart.add(item);
  }

  @action
  void removeAll() {
    itemsInCart.clear();
  }

  @action
  void remove(Item item) {
    itemsInCart.remove(item);
  }
}
