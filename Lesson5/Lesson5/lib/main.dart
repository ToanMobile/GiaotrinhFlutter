import 'package:flutter/material.dart';
import 'package:lesson5/screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final listData = ["Lesson 1", "Lesson 2", "Lesson 3", "Lesson 4", "Lesson 5", "Lesson 6", "Lesson 7", "Lesson 8", "Lesson 9", "Lesson 10", "Lesson 11", "Lesson 12"];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                height: 1000,
                child: buildWidgetGridView(),
              ),
              Positioned(
                left: 100,
                top: 300,
                child: Container(
                  width: 100,
                  height: 100,
                  child: buildWidgetListView(),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildWidgetListView() => Container(
        color: Colors.yellow,
        child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (BuildContext context, index) {
              return itemList(index);
            }),
      );

  Widget buildWidgetGridView() => Container(
        color: Colors.red,
        child: GridView.builder(
            itemCount: listData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemBuilder: (BuildContext context, index) {
              return itemList(index);
            }),
      );

  Widget itemList(int index) => Container(
        height: 100,
        width: 200,
        child: Center(
          child: Text(
            listData[index],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      );
}
