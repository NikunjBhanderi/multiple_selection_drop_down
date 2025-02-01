import 'package:flutter/material.dart';
import 'package:multiple_selection_drop_down/multiple_selection_drop_down.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FruitsModel> listOfSelectedFruits = [];
  List<FruitsModel> listOfFruits = [
    FruitsModel(id: 1, name: "Mango"),
    FruitsModel(id: 2, name: "Banana"),
    FruitsModel(id: 3, name: "Apple"),
    FruitsModel(id: 4, name: "Grape"),
    FruitsModel(id: 5, name: "Orange"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multiple Select Dropdown example'),
        ),
        body: Center(
          child: MultipleSelectionDropDownView(
            items: listOfFruits,
            selectedItemList: listOfSelectedFruits,
            displayText: (value) => value.name,
            onChange: (value) {
              listOfSelectedFruits = value;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

class FruitsModel {
  final int id;
  final String name;

  FruitsModel({required this.id, required this.name});
}
