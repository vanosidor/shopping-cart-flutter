import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/cart_page.dart';
import 'package:shopping_cart/pages/catalog_page.dart';
import 'package:shopping_cart/pages/login_page.dart';

const String loginPageRoute = '/login';
const String cartPageRoute = '/cart';
const String catalogPageRoute = '/catalog';

class Routes {
  static String initialRoute = loginPageRoute;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPageRoute:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case cartPageRoute:
        return MaterialPageRoute(
          builder: (context) => CartPage(),
        );
      case catalogPageRoute:
        return MaterialPageRoute(
          builder: (context) => CatalogPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
    }
  }
}
