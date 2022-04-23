import 'package:flutter/material.dart';
import 'package:lesson10demo/page3.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String dataBack = '';

  void navigationPage3Push() {
    Navigator.pushNamed(context, '/page3', arguments: "Lesson10").then((value) {
      setState(() {
        dataBack = value.toString();
      });
    });
  }

  void navigationPage3PushData() {
    Navigator.pushNamed(context, '/page3', arguments: "Lesson 10");
  }

  void navigationPage3PushReplace() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Page3()));
  }

  void pushAndRemoveUntil() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => Page3()), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dataBack, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
            const Text(
              'Page2',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            ElevatedButton(onPressed: navigationPage3Push, child: const Text('navigationPage3Push')),
            ElevatedButton(onPressed: navigationPage3PushReplace, child: const Text('navigationPage3PushReplace')),
            ElevatedButton(onPressed: pushAndRemoveUntil, child: const Text('pushAndRemoveUntil')),
            ElevatedButton(onPressed: navigationPage3PushReplace, child: const Text('navigationPage3PushReplace')),
            ElevatedButton(onPressed: navigationPage3PushData, child: const Text('navigationPage3PushData')),
          ],
        ),
      ),
    );
  }
}
