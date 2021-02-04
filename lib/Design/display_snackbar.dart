import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

main () => runApp(SnackBarDemo());

class SnackBarDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Demo'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}
class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Show SnackBar'),
        onPressed: (){
          final snackBar = SnackBar(content: Text('Yay! SnackBar!'),
          action: SnackBarAction(
              label: 'Undo',
            onPressed: (){},
          ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },

      ),
    );
  }
}

