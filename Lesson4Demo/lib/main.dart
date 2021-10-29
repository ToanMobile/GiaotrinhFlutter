import 'package:flutter/material.dart';
import 'package:lesson4/pages/example_page.dart';

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
  int _counter = 0;
  String demoTitle = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WidgetState(
        demoTitle: demoTitle,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WidgetNoState extends StatelessWidget {
  const WidgetNoState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Demo Text',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}

class WidgetState extends StatefulWidget {
  var demoTitle;

  WidgetState({Key? key, required this.demoTitle}) : super(key: key);

  @override
  _WidgetStateState createState() => _WidgetStateState();
}

class _WidgetStateState extends State<WidgetState> with WidgetsBindingObserver {
  bool isShow = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('DemoLesson4: appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        print('DemoLesson4: appLifeCycleState resumed');
        break;
      case AppLifecycleState.paused:
        print('DemoLesson4: appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('DemoLesson4: appLifeCycleState detached');
        break;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('DemoLesson4: didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant WidgetState oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('DemoLesson4: didUpdateWidget');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    print('DemoLesson4: dispose');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print('DemoLesson4: initState');
    // setState(() {
    //   widget.demoTitle = 'Demo Text';
    // });
  }

  void changeTitle() {
    Future.delayed(
        Duration.zero,
        () => setState(() {
              widget.demoTitle = 'Title Change';
              isShow = true;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.demoTitle,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              'Show',
              style: TextStyle(fontSize: isShow ? 40 : 20, color: isShow ? Colors.amber : Colors.black),
            ),
            ElevatedButton(onPressed: () => changeTitle(), child: Text("Change Title")),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Page2())
                );
              },
              child: Text('Navigate to new route'),
            ),
          ],
        ),
      ),
    );
  }
}
