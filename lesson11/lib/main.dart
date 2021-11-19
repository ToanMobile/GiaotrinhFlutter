import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson11/sqlite/sqlite.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(SQlitePage());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPref(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SharedPref extends StatelessWidget {
  createdata(String username, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Username", username);
    sharedPreferences.setString("Password", password);
    print("Data stored!");
  }

  getdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? username = sharedPreferences.getString("Username");
    String? password = sharedPreferences.getString("Password");
    print("the username is $username");
    print("the password is $password");
  }

  cleardata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    print("data has been deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              color: Colors.amber,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    createdata("ToanMobile", "1234");
                  },
                  child: Text('Create data'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              color: Colors.amber,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    getdata();
                  },
                  child: Text('Get data'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              color: Colors.amber,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    cleardata();
                  },
                  child: Text('Clear data'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}