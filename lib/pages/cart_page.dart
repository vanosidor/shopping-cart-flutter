import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/common/routes.dart';
import 'package:shopping_cart/store/cart_store.dart';

class CartPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Selected items'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(child: CartList()),
            Divider(
              height: 8,
              color: Colors.black,
            ),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartStore = context.watch<CartStore>();
    return Observer(
      builder: (context) {
        return ListView.builder(
          itemCount: cartStore.itemsInCart.length,
          itemBuilder: (context, index) {
            var _item = cartStore.itemsInCart[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () => cartStore.remove(_item),
                ),
                title: Text(_item.name),
              ),
            );
          },
        );
      },
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartStore = context.watch<CartStore>();
    return Container(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (context) {
                return Text(
                  '\$${cartStore.totalPrice}',
                  style: Theme.of(context).textTheme.headline2,
                );
              },
            ),
            SizedBox(width: 16),
            RaisedButton(
              onPressed: () async {
                var duration = Duration(seconds: 2);
                Scaffold.of(context).showSnackBar(SnackBar(
                    duration: duration,
                    content: Text('Congratulations! Purchase success!')));
                cartStore.removeAll();
                await Future.delayed(duration);
                Navigator.pushNamed(context, catalogPageRoute);
              },
              child: Text('BUY'),
            )
          ],
        ));
  }
}
