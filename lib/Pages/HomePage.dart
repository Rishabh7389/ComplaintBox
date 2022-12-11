import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaint Box"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text("All Compaint List"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
