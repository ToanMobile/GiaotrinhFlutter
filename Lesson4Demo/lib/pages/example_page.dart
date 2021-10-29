import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: const Center(
        child: Text('Example Route', style: TextStyle(fontSize: 20, color: Colors.black),),
      ),
    );
  }
}
