// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final int id;

  final String name;

  @override
  String toString() {
    return 'Person{id: $id, name: $name}';
  }

  Person(this.id, this.name);
}