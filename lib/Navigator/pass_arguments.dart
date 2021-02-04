import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ExtractSA.routeName: (context) => ExtractSA(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, ExtractSA.routeName,
              arguments: ScreenArguments(),);
            }, child: Text('Extract Arguments'))
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title, argument;

  ScreenArguments({this.title, this.argument});
}

class ExtractSA extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg.title),
      ),
      body: Center(
        child: Text(arg.argument),
      ),
    );
  }
}
