import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Route page'
          ),
        ),
        body: Page1(),
      ),
      onGenerateRoute: (setting){
        switch(setting.name){
          case '/':
            return MaterialPageRoute(builder: (context)=> Page1());
            break;
          case '/second':
            User user = setting.arguments;
            return MaterialPageRoute(builder: (context)=> Page2(user:
              user,));
            break;
        }
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: (){
          User user = User(name: 'Mike', age: 25);
          Navigator.pushNamed(context, '/page2', arguments: user);
          // Route route = MaterialPageRoute(builder: (context) => Page2(user: user,));
          // Navigator.push(context, route);
        },
        child: Text('move to page2'),
      ),
    );
  }
}
class Page2 extends StatelessWidget {
  final User user;
  Page2({this.user});
  @override
  Widget build(BuildContext context) {
    // RouteSettings setting = ModalRoute.of(context).settings;
    // user = setting.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name}-${this.user.age}'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go back Page1'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
class User{
  final String name;
  final int age;
  User({this.name, this.age});
}
