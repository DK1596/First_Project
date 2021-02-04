import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Floating App Bar'),
              floating: true,
              flexibleSpace: Placeholder(),
              expandedHeight: 250,
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('Item $index'),
                ),
              childCount: 100,
            ),
            )
          ],
        ),
      ),
    );
  }
}
