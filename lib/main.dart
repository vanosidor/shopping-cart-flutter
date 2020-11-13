import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/common/routes.dart';
import 'package:shopping_cart/common/theme.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CatalogModel(),
        ),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        )
      ],
      child: MaterialApp(
        title: 'Cart Demo',
        theme: appTheme,
        initialRoute: loginPageRoute,
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      ),
    );
  }
}
