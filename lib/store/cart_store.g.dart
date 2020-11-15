// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  Computed<int> _$totalPriceComputed;

  @override
  int get totalPrice => (_$totalPriceComputed ??=
          Computed<int>(() => super.totalPrice, name: '_CartStore.totalPrice'))
      .value;

  final _$itemsInCartAtom = Atom(name: '_CartStore.itemsInCart');

  @override
  ObservableList<Item> get itemsInCart {
    _$itemsInCartAtom.reportRead();
    return super.itemsInCart;
  }

  @override
  set itemsInCart(ObservableList<Item> value) {
    _$itemsInCartAtom.reportWrite(value, super.itemsInCart, () {
      super.itemsInCart = value;
    });
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void add(Item item) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.add');
    try {
      return super.add(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAll() {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.removeAll');
    try {
      return super.removeAll();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Item item) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.remove');
    try {
      return super.remove(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemsInCart: ${itemsInCart},
totalPrice: ${totalPrice}
    ''';
  }
}
