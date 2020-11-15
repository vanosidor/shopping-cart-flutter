import 'package:flutter/material.dart';
import 'package:shopping_cart/common/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login Page')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(hintText: 'Login'),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(hintText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 32),
                RaisedButton(
                  color: Colors.yellow,
                  child: Text('Continue'),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, catalogPageRoute),
                )
              ],
            ),
          ),
        ));
  }
}
