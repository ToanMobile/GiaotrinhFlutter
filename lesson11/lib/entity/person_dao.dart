// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:lesson11/entity/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person?> findPersonById(int id);

  @Query('DELETE * FROM Person WHERE id = :id')
  Stream<Person?> deletePerson(int id);

  @insert
  Future<void> insertPerson(Person person);
}