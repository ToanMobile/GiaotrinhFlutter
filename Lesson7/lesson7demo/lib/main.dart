import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController sdtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                'assets/bg_top.png',
                width: 400,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(right: 0, bottom: 0, child: Image.asset('assets/bg_bottom.png', width: 400, fit: BoxFit.fitHeight)),
            Positioned(
              left: 10,
              top: 50,
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 40,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(top: 109, left: 50, right: 50, bottom: 10),
              child: Column(
                children: [
                  Image.asset('assets/ic_icon.png', width: 280, height: 80),
                  SizedBox(
                    height: 79,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Điện thoại',
                        style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: sdtController,
                        decoration: InputDecoration(
                          hintText: 'Nhập số điện thoại của bạn',
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.red, width: 5)),
                        ),
                        onChanged: (text) {
                          print('onChanged":":::' + text);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () => {sdtController.value.text.length == 10 ? print('login ok') : null},
                      style: ButtonStyle(
                        backgroundColor: sdtController.value.text.length == 10 ? MaterialStateProperty.all<Color>(Colors.blue) : MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      child: Text(
                        'Tiếp tục',
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40), border: Border.all(color: Colors.black12, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hotline'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '1900-645-241',
                          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
