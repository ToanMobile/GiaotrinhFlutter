import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson11/entity/database.dart';
import 'package:lesson11/entity/person.dart';
import 'package:lesson11/entity/person_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SQlitePage extends StatefulWidget {
  const SQlitePage({Key? key}) : super(key: key);

  @override
  _SQlitePageState createState() => _SQlitePageState();
}

class _SQlitePageState extends State<SQlitePage> {
  late PersonDao personDao;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    personDao = database.personDao;
  }

  Future<void> createData(String username, String password) async {
    print("Data stored!");
    final person = Person(1, username);
    await personDao.insertPerson(person);
    print("Data stored!");
  }

  getData() async {
    final result = await personDao.findPersonById(1);
    result.forEach((event) =>  print("the result is ${event.toString()}"));
  }

  clearData() async {
    final result = await personDao.deletePerson(1);
    print("the clearData is $result");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                color: Colors.amber,
                child: Center(
                  child: TextButton(
                    onPressed: () async => createData("ToanMobile", "1234"),
                    child: Text('Create data'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                color: Colors.amber,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      getData();
                    },
                    child: Text('Get data'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                color: Colors.amber,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      clearData();
                    },
                    child: Text('Clear data'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
