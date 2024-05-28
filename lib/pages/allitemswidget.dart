import 'package:flutter/material.dart';
import 'package:western/widgets/itemsWidget.dart';
import 'package:western/widgets/itemsWidget2.dart';
import 'package:western/widgets/itemsWidget3.dart';
import 'package:western/widgets/itemsWidget4.dart';
import 'package:western/widgets/itemsWidget5.dart';

class AllItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Items"),
        backgroundColor: Color.fromARGB(255, 94, 134, 143),
      ),
      body: ListView(
        children: [
          ItemsWidget(),
          ItemsWidget2(),
          ItemsWidget3(),
          ItemsWidget4(),
          ItemsWidget5(),
        ],
      ),
    );
  }
}
