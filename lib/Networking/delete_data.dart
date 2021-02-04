import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking'),
      ),
    );
  }
}
Future<http.Response>getData () async {
  const url = 'https://about.google/static/data/locations.json';
  return await http.get(url);
}

void loadData (){
  getData().then((response){
    if (response.statusCode == 200){
      print(response.body);
    }else {
      print(response.statusCode);
    }
  }).catchError((error){
    debugPrint(error.toString());
  });
}
