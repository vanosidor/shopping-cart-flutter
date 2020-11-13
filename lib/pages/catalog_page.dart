import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/common/routes.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/catalog.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CatalogAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ListItem(index: index)),
        ),
      ],
    ));
  }
}

class CatalogAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      actions: [
        IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, cartPageRoute)),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Catalog',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int index;

  const ListItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _item = context
        .select<CatalogModel, Item>((catalog) => catalog.getByPosition(index));

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 64,
            height: 64,
            color: _item.color,
          ),
        ),
        SizedBox(width: 8),
        Text(_item.name, style: Theme.of(context).textTheme.headline6),
        Spacer(),
        AddButton(
          item: _item,
        ),
        SizedBox(
          width: 8,
        )
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final Item item;

  AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isInCart = context.select<CartModel, bool>((cart) {
      return cart.items.contains(item);
    });

    return FlatButton(
        onPressed: isInCart
            ? null
            : () {
                final _cart = context.read<CartModel>();
                _cart.add(item);
              },
        child: isInCart ? Icon(Icons.check) : Text('ADD'));
  }
}
