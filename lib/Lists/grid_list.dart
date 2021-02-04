import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Grid Demo';
    return MaterialApp(
      title: appTitle,
      home: Gridlist(title: appTitle,),
    );
  }
}


class Gridlist extends StatelessWidget {
  final String title;
  Gridlist({Key key, this.title}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              color: Colors.red,
            ),
            Container(
              width: 160,
              color: Colors.cyan,
            ),
            Container(
              width: 160,
              color: Colors.green,
            ),
            Container(
              width: 160,
              color: Colors.deepPurple,
            ),
            Container(
              width: 160,
              color: Colors.lime,
            ),
            Container(
              width: 160,
              color: Colors.pinkAccent,
            ),
            Container(
              width: 160,
              color: Colors.brown,
            ),
          ],
        ),
      ),
      // body: GridView.count(
      //     crossAxisCount: 2,
      //   children: List.generate(10, (index){
      //     return Center(
      //         child: Text(
      //           'Item $index',
      //           style: Theme.of(context).textTheme.headline5,
      //         ),
      //     );
      //   }),
      // ),
    );
  }
}
