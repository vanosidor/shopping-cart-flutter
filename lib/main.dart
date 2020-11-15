import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/common/routes.dart';
import 'package:shopping_cart/common/theme.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/store/cart_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CartStore(CatalogModel()),
      child: MaterialApp(
        title: 'Cart Demo',
        theme: appTheme,
        initialRoute: loginPageRoute,
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      ),
    );
  }
}
