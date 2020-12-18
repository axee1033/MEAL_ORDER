import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body:CategoriesScreen(),
      
    );
  }
}