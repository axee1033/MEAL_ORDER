import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  final where = Uri.encodeQueryComponent(jsonEncode({
    "Cell_Phone_Brand": {"\$exists": true}
  }));
  final response = await http.get(
      'https://parseapi.back4app.com/classes/Cellphonedataset_Cell_Phone_Models_By_Brand?count=1&limit=10&order=Cell_Phone_Brand&where=$where',
      headers: {
        "X-Parse-Application-Id":
            "zEBTuCZIwQzAFvOYwY5r7KxPifCWTk5M5rIUxOiP", // This is your app's application id
        "X-Parse-REST-API-Key":
            "78ABYuSjp2foEJrn8y4Qq0guz9R9VK6tp4JRLOoo" // This is your app's REST API key
      });
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch data');
  }
}

class MyApp2 extends StatefulWidget {
  MyApp2({Key key}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  Future<Map<String, dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData(); // Here you have the data that you need
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new SingleChildScrollView(
        child: FutureBuilder<Map<String, dynamic>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  new JsonEncoder.withIndent('  ').convert(snapshot.data));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
