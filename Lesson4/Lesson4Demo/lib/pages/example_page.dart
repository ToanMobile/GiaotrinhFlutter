import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    print('Page2: initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Page2: didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('Page2: dispose');
    super.dispose();
  }

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
