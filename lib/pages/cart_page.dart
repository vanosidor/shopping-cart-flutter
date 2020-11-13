import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/common/routes.dart';
import 'package:shopping_cart/models/cart.dart';

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
    final cart = context.watch<CartModel>();
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        var _item = cart.items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () => cart.remove(_item),
            ),
            title: Text(_item.name),
          ),
        );
      },
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Container(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '\$${cart.totalPrice}',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(width: 16),
            RaisedButton(
              onPressed: () async {
                var duration = Duration(seconds: 2);
                Scaffold.of(context).showSnackBar(SnackBar(
                    duration: duration,
                    content: Text('Congratulations! Purchase success!')));
                cart.removeAll();
                await Future.delayed(duration);
                Navigator.pushNamed(context, catalogPageRoute);
              },
              child: Text('BUY'),
            )
          ],
        ));
  }
}
