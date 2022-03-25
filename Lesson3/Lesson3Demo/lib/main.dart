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
      home: const DemoString(title: 'Flutter Demo Lesson 3'),
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
  var demoString = "Demo lesson";
  var resultLength = "";
  var resultIndexOf = "";
  var resultSubString = "";
  var resultSplit = "";

  var lesson3 = 1;

  bool isGiau = false;
  int cayVang =1;
  String toan2 = "Toan dang day hoc";
  List toan3 = ["item1","item2", "item3"];

  void _countLength() {
    setState(() {
      resultLength = demoString.length.toString();
    });
  }

  void _indexOf() {
    setState(() {
      resultIndexOf = demoString.indexOf('o').toString();
    });
  }

  void _subString() {
    setState(() {
      resultSubString = demoString.substring(2, 6);
    });
  }

  void _split() {
    setState(() {
      resultSplit = demoString.split("lesson").toString();
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
            Center(
              child: Text(
                demoString,
                style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,
              ),
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
    demoList.addAll(['Flutter', 'IOS', 'React Native', 'IONIC', 'XAMARIN', 'Android']);
  }

  void _countLength() {
    setState(() {
      resultLength = demoList.length.toString();
    });
  }

  void _checkItem() {
    setState(() {
      checkItem = demoList.contains("android");
    });
  }

  void _getItem() {
    setState(() {
      resultGetItem = demoList[2].toString();
    });
  }

  void _getItemTake() {
    setState(() {
      resultTakeItem.clear();
      resultTakeItem.addAll(demoList.skip(2));
    });
  }

  void _getItemFirst() {
    setState(() {
      resultGetItemFirst = demoList.first;
    });
  }

  void _getItemLast() {
    setState(() {
      resultGetItemLast = "${demoList.last}";
    });
  }

  void _addItem() {
    setState(() {
      if(resultAddItem.isEmpty){
        resultAddItem = demoList;
      }
      resultAddItem.add("Lesson1");
      resultAddItem.addAll(["Lesson 2", "Lesson 3"]);
      resultAddItem = ["Lesson 2", "Lesson 3"];
    });
  }

  void _removeItem() {
    setState(() {
      if(resultRemoveItem.isEmpty){
        resultRemoveItem.addAll(demoList);
      }
      resultRemoveItem.removeAt(1);
      //resultRemoveItem.remove('IOS');
      //resultRemoveItem.removeRange(1,4); //Start index 1 to index 3 (length = 3)
      //resultRemoveItem.removeWhere((item) => item.toString().startsWith('I'));
    });
  }

  void _mapItem() {
    setState(() {
      demoList.forEach((e) => resultItemMap += ("+" + e));
    });
  }

  void _whereItem() {
    setState(() {
      resultWhere.clear();
      resultWhere.addAll(demoList.where((element) => (element as String) == "IOS" || (element as String) == "Android"));
      // var listNew = demoList.where((element) => element.toString() == 'Android');
      // resultWhere.addAll(listNew);
      print('resultWhere:' + resultWhere.toString());
    });
  }

  void _mergeItem() {
    setState(() {
      // resultMerge.addAll(resultAddItem);
      // resultMerge.addAll(resultWhere);
      resultMerge.clear();
      /*resultAddItem.forEach((e) => resultMerge.add(e));
      resultWhere.forEach((e) => resultMerge.add(e));*/
      resultMerge.addAll(resultRemoveItem);
      resultMerge.addAll(resultWhere);
      print('resultWhere:' + resultMerge.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Text(
                  demoList.toString(),
                  style: const TextStyle(fontSize: 30, fontStyle: FontStyle.normal), textAlign: TextAlign.center,
                ),
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
                'Get Item Last: $resultGetItemLast',
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
