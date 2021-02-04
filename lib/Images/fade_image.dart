import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Fade in Image';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Stack(
          children: <Widget>[
            // Center(
            //   child: CircularProgressIndicator(),),
            Center(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/YVPG.gif',
                image: 'https://i.pinimg.com/originals/95/d8/61/95d861083790fa070a381ab78205f406.jpg',
              ),
            )
          ],
        ),
      ),
    );
  }
}
