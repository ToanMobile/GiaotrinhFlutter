import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lesson6/dimens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print("width==="+ 300.w.toString());
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: buildNgang()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildWidgetBeark() => Row(
        children: [
          Container(
            width: 200,
            height: 100,
            color: Colors.green,
            child: const Text(
              'Demo Lesson 5',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            width: 200,
            height: 100,
            color: Colors.green,
            child: const Text(
              'Demo Lesson 6',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      );

  Widget buildWidgetInfoScreen() => Column(
        children: [
          Text(
            MediaQuery.of(context).size.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            MediaQuery.of(context).size.width.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            MediaQuery.of(context).size.height.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            (MediaQuery.of(context).size.height / MediaQuery.of(context).size.width).toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ],
      );

  Widget buildWidgetIcon() => Column(
        children: const [
          Icon(Icons.access_time_outlined, size: 100),
        ],
      );

  Widget buildWidgetImage() => Image.asset(
        'assets/ic_icon.png',
        width: 600,
        fit: BoxFit.fitHeight,
      );

  Widget buildWidgetDemoNoScale() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 100,
            color: Colors.blue,
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.green,
          ),
          SizedBox(height: 20.h),
          const Text(
            'No Scale',
            style: TextStyle(fontSize: 30),
          )
        ],
      );

  Widget buildWidgetDemoScale() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 100,
            color: Colors.blue,
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.green,
          ),
          Container(
            width: 300.w,
            height: 50.w,
            color: Colors.yellow,
          ),
          Container(
            width: 100.w,
            height: 50.w,
            color: Colors.green,
          ),
          SizedBox(height: 20.h),
          const Text(
            'No Scale',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Text Scale',
            style: TextStyle(fontSize: 30.t),
          )
        ],
      );

  Widget buildNgang() => Container(
    width: 300.w,
    height: 50.w,
    color: Colors.yellow,
  );

  Widget buildDung() => Container();
}
