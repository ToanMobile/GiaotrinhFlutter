
import 'package:flutter/material.dart';
import 'package:lesson5/screen2.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  void _incrementCounter() {
    setState(() {
      count++;
    });
  }

  void navigationList() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.all(Radius.circular(10)), border: Border.symmetric(vertical: BorderSide.none)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lesson 4: count=$count',
              style: TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 50,
                  color: Colors.green,
                ),
                Image.asset(
                  'assets/images/demo2.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: _incrementCounter, child: Text('Click Button')),
            ),
            IconButton(
              onPressed: _incrementCounter,
              icon: Icon(Icons.exit_to_app),
            ),
            Container(
              color: Colors.pinkAccent,
              width: 300,
              height: 300,
              child: Stack(
                children: [
                  Positioned(
                    left: 50,
                    right: 50,
                    child: Text(
                      'Lesson 4',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 100,
                    child: Text(
                      'Lesson 5',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigationList,
        tooltip: 'Increment',
        child: Text('Demo'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
