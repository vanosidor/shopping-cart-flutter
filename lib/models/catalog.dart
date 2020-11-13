import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Item getById(int id) => Item(
      id: id,
      name: itemNames[id % itemNames.length],
      color: Item.generateColor(id));

  Item getByPosition(int position) => Item(
      id: position,
      name: itemNames[position % itemNames.length],
      color: Item.generateColor(position));
}

@immutable
class Item extends Equatable {
  static Color generateColor(int id) {
    return Colors.primaries[id % Colors.primaries.length];
  }

  final int id;
  final String name;
  final Color color;
  final int price = 42;

  const Item({@required this.id, @required this.name, @required this.color})
      : assert(id != null),
        assert(name != null),
        assert(color != null);

  @override
  List<Object> get props => [name, price, color];
}
