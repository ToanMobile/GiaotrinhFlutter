import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lesson12/model/user_info.dart';
import 'package:lesson12/user_model.dart';

import 'model_list/list_demo.dart';

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
  UserInfo? data = null;
  ListDemo? listDemo = null;

  Future<void> demoGetApiDio() async {
    final stopwatch = Stopwatch()..start();
    final dio = Dio();
    final response = await dio.get('https://api.github.com/users/ToanMobile');
    setState(() {
      data = UserInfo.fromJson(response.data);
      print('responseData:::' + response.data.toString());
      print('Time: ${stopwatch.elapsed}');
      //0:00:00.908019
    });
  }

  Future<void> demoGetApiHttp() async {
    final stopwatch = Stopwatch()..start();
    var url = Uri.https('api.github.com', '/users/ToanMobile');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = response.body.toString();
      setState(() {
        print('responseData:::' + response.body.toString());
        print('Time: ${stopwatch.elapsed}');
        //Elapse: 0:00:00.657958
      });
    }
  }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString("assets/test.json").then((jsonStr) => jsonDecode(jsonStr)).then((json) {
      print('loadString::' + json.toString());
      listDemo = ListDemo.fromJson(json);
      print('listDemo::' + listDemo.toString());
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data?.name ?? '', style: Theme.of(context).textTheme.headline4),
            Text(data?.location ?? '', style: Theme.of(context).textTheme.headline4),
            Text(data?.bio ?? '', style: Theme.of(context).textTheme.headline4),
            Expanded(
              child: ListView.builder(
                  itemCount: listDemo?.data?.rents?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Text(listDemo?.data?.rents?[index].id.toString() ?? '', style: Theme.of(context).textTheme.headline4);
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: demoGetApiDio,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
