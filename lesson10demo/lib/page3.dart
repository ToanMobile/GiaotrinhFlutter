import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Page3',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            Text(
              ModalRoute.of(context)!.settings.arguments.toString() ?? '',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('PopNoData')),
            ElevatedButton(onPressed: () => Navigator.pop(context, "Demo Lesson10 Back"), child: const Text('PopHasData')),
          ],
        ),
      ),
    );
  }
}
