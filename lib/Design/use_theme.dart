import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Custom Fonts';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],
          fontFamily: 'Raleway',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14, fontFamily: 'Robotomono'),
          )),
      home: HomePage(
        title: appTitle,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Text with background color',
            style: Theme.of(context).textTheme.headline6,
          ),
          color: Theme.of(context).accentColor,
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(secondary: Colors.yellow)),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
        ),
      ),
    );
  }
}
