import 'package:flutter/material.dart';
import 'package:lesson10demo/page2.dart';
import 'package:lesson10demo/page3.dart';

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
      routes: <String, WidgetBuilder>{
        '/page2': (BuildContext context) => Page2(),
        '/page3': (BuildContext context) => Page3(),
      },
      home: const MyHomePage(title: 'LESSON 10'),
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
  void navigationPage2Push() {
    Navigator.pushNamed(context, '/page2');
  }

  void navigationPage2PushReplace() {
    Navigator.pushReplacementNamed(context, '/page2');
  }

  void pushAndRemoveUntil() {
    Navigator.pushNamedAndRemoveUntil(context, '/page2',(Route<dynamic> route) => false);
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
            Text(
              "Page1",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            ElevatedButton(onPressed: navigationPage2Push, child: const Text('navigationPage2Push')),
            ElevatedButton(onPressed: navigationPage2PushReplace, child: const Text('navigationPage2PushReplace')),
            ElevatedButton(onPressed: pushAndRemoveUntil, child: const Text('pushAndRemoveUntil')),
          ],
        ),
      ),
    );
  }
}
