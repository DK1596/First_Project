import 'dart:convert';
import 'package:flutter_first_app/Navigator/pass_arguments.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<OfficesList> officesList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    officesList = getOfficesList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json'),
      ),
      body: FutureBuilder<OfficesList>(
        future: officesList,
        builder: (context, snapShot){
            if(snapShot.hasData){
              return ListView.builder(itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    title: ,
                  ),
                );
              },
              itemCount: snapShot.data.offices.length,);
            }else if (snapShot.hasError){
              return Text('Error');
            }
        },
      ),
    );
  }
}


class OfficesList {
  List<Office> offices;
  OfficesList({this.offices});
  factory OfficesList.fromJson(Map<String, dynamic>json){
    var officesJson = json['offices'] as List;
    List<Office> officesList = officesJson.map((e) => Office.fromJson(e)).toList();

    return OfficesList(
      offices: officesList,
    );
  }
}
class Office{
  final String name, address, image;
  Office({this.name, this.address, this.image});

  factory Office.fromJson(Map<String, dynamic>json){
    return Office(
      name: json['name'] as String,
      address: json['address'] as String,
      image: json['image'] as String
    );
  }
}

Future <OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(url);
  if (response.statusCode == 200){
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error ${response.reasonPhrase}');
  }
}