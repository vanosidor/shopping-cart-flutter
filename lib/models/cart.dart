import 'package:flutter/foundation.dart';
import 'package:shopping_cart/models/catalog.dart';

class CartModel extends ChangeNotifier {
  CatalogModel _catalogModel;

  CatalogModel get catalog => _catalogModel;

  final List<int> _itemIds = [];

  List<Item> get items =>
      _itemIds.map((id) => _catalogModel.getById(id)).toList();

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) != null),
        'The catalog $newCatalog does not have one of $_itemIds in it.');

    _catalogModel = newCatalog;
    notifyListeners();
  }

  int get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void removeAll() {
    _itemIds.clear();
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
