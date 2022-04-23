import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController searchController = TextEditingController()..text = 'ToanMobile';
  String responseData = '';

  void demoTest() async {
    await Future.delayed(Duration(seconds: 5), () {
      print('1');
    });
    print('2');
    print('3');
    print('4');
  }

  Future<void> demoApi() async {
    var dio = Dio();
    /* await Future.delayed(Duration(seconds: 10), () {
      searchController.text = 'CheNgot';
    });*/
    print("searchController::" + searchController.text.toString());
    final response = await dio.get('https://api.github.com/users/${searchController.text}');
    responseData = response.data.toString();
    setState(() {
      print('responseData:::' + responseData);
    });
  }

  // Future to run
  Future<bool> myTypedFuture(int id, int duration) async {
    await Future.delayed(Duration(seconds: duration));
    print('Delay complete for Future $id');
    return true;
  }

  // Running multiple futures
  Future<void> demo2List() async {
    // Create list of multiple futures
    var futures = <Future>[];
    for (int i = 0; i < 10; i++) {
      futures.add(myTypedFuture(i, Random(i).nextInt(10)));
    }
    // Waif for all futures to complete
    await Future.wait(futures);
    // We're done with all futures execution
    print('All the futures has completed');
  }

  Future<void> demoListArray() async {
    var futures = <int>[];
    for (int i = 0; i < 10; i++) {
      futures.add(i);
    }
    print('Delay complete for Future $futures');
    print('All the futures has completed');
  }

  void demo3NoAwait() {
    demoApi();
    demoListArray();
  }

  void demo4NoAwait() async {
    print('demo4NoAwait');
    await demoApi();
    demoListArray();
  }

  Future<void> demo5MutilAwait() async {
    print('demo5MutilAwait');
    demoListArray();
    await demoApi();
  }

  void test() async {
    Future.delayed(Duration(seconds: 5), () {
      demoApi();
    });
    await demoListArray();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: searchController,
            ),
            Text(
              responseData,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: test,
        tooltip: 'Increment',
        child: const Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
