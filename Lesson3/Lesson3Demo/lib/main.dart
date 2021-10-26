import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum UserGroup { guest, member, admin }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Lesson 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoList(title: 'Flutter Demo Lesson 3'),
    );
  }
}

class DemoString extends StatefulWidget {
  const DemoString({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DemoString> createState() => _DemoStringState();
}

class _DemoStringState extends State<DemoString> {
  var demoString = "Demo lesson 3 khoa 2";
  var resultLength = "";
  var resultIndexOf = "";
  var resultSubString = "";
  var resultSplit = "";

  void _countLength() {
    setState(() {
      resultLength = demoString.length.toString();
    });
  }

  void _indexOf() {
    setState(() {
      resultIndexOf = demoString.indexOf('e').toString();
    });
  }

  void _subString() {
    setState(() {
      resultSubString = demoString.substring(5, 13);
    });
  }

  void _split() {
    setState(() {
      resultSplit = demoString.split('lesson 3').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              demoString,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 100),
            Text(
              'Total length: $resultLength',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () => _countLength(), child: const Text('Length')),
            Text(
              'Index Of: $resultIndexOf',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () => _indexOf(), child: const Text('Index Of')),
            Text(
              'SubString: $resultSubString',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () => _subString(), child: const Text('Sub String')),
            Text(
              'Split: $resultSplit',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () => _split(), child: const Text('Split'))
          ],
        ),
      ),
    );
  }
}

class DemoList extends StatefulWidget {
  const DemoList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DemoList> createState() => _DemoListState();
}

class _DemoListState extends State<DemoList> {
  var demoList = [];
  String resultLength = "";
  String resultGetItem = "";
  String resultGetItemFirst = "";
  String resultGetItemLast = "";
  String resultItemMap = "";
  bool checkItem = false;
  var resultTakeItem = [];
  var resultAddItem = [];
  var resultRemoveItem = [];
  var resultWhere = [];
  var resultMerge = [];

  @override
  void initState() {
    super.initState();
    demoList.addAll(['Flutter', 'Android', 'IOS', 'React Native', 'IONIC', 'XAMARIN']);
  }

  void _countLength() {
    setState(() {
      resultLength = demoList.length.toString();
    });
  }

  void _checkItem() {
    setState(() {
      checkItem = demoList.contains('Flutter');
    });
  }

  void _getItem() {
    setState(() {
      resultGetItem = demoList[5].toString();
    });
  }

  void _getItemTake() {
    setState(() {
      resultTakeItem.addAll(demoList.take(3));
    });
  }

  void _getItemFirst() {
    setState(() {
      resultGetItem = demoList.last.toString();
    });
  }

  void _getItemLast() {
    setState(() {
      resultGetItem = "${demoList.last}";
    });
  }

  void _addItem() {
    setState(() {
      if (resultAddItem.isEmpty) {
        resultAddItem.addAll(demoList);
      }
      resultAddItem.add("test");
    });
  }

  void _removeItem() {
    setState(() {
      if (resultRemoveItem.isEmpty) {
        resultRemoveItem.addAll(demoList);
      }
      resultRemoveItem.removeAt(0);
    });
  }

  void _mapItem() {
    setState(() {
      demoList.forEach((e) => resultItemMap += ("+" + e));
    });
  }

  void _whereItem() {
    setState(() {
      resultWhere.addAll(demoList.where((e) => e.contains('Android')));
      print('resultWhere:' + resultWhere.toString());
    });
  }

  void _mergeItem() {
    setState(() {
      //resultMerge = [resultWhere, resultRemoveItem];
      resultMerge.addAll(resultWhere);
      resultMerge.addAll(resultRemoveItem);
      print('resultWhere:' + resultMerge.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                demoList.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 100),
              Text(
                'Total length: $resultLength',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _countLength(), child: const Text('Length')),
              Text(
                'Get Take: $resultTakeItem',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _getItemTake(), child: const Text('Get Take')),
              Text(
                'Get Item: $resultGetItem',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _getItem(), child: const Text('Get Item')),
              Text(
                'Check Item: $checkItem',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _checkItem(), child: const Text('Check Item')),
              Text(
                'Get Item First: $resultGetItemFirst',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _getItemFirst(), child: const Text('Get Item First')),
              Text(
                'Get Item Last: $resultGetItemFirst',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _getItemLast(), child: const Text('Get Item Last')),
              Text(
                'Add Item: ${resultAddItem.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _addItem(), child: const Text('Add Item')),
              Text(
                'Remove Item: ${resultRemoveItem.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _removeItem(), child: const Text('Remove Item')),
              Text(
                'Map Item: ${resultItemMap.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _mapItem(), child: const Text('Map Item')),
              Text(
                'Where: ${resultWhere.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _whereItem(), child: const Text('Where Item')),
              Text(
                'Merge: ${resultMerge.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () => _mergeItem(), child: const Text('Where Item')),
            ],
          ),
        ),
      ),
    );
  }
}
