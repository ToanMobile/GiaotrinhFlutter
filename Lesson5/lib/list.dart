import 'package:flutter/material.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  final listDemo = ['item1, item2','item1, item2','item1, item2','item1, item2','item1, item2','item1, item2','item1, item2','item1, item2'];

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }

  Widget buildWidgetListView() => ListView.builder(
        itemCount: listDemo.length,
        itemBuilder: (BuildContext context, index) {
          return Text(listDemo[index]);
        },
      );

  Widget buildWidgetGridView() => GridView.builder(
      itemCount: listDemo.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, index) {
        return Text(listDemo[index]);
      });
}
