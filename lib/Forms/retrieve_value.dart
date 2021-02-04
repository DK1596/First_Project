import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve text input',
      home: MyCustomForm(),
    );
  }
}


class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final MyController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    MyController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve text input'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: MyController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(MyController.text),
              );
            }
          );
        },
        tooltip: 'Show me value',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
