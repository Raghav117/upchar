import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  Dialog dialog = Dialog(
    child: Container(
      height: 300,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [Text("Filters"), Text("")],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => dialog,
            );
          },
          icon: Icon(Icons.menu),
        ),
      ),
    );
  }
}
