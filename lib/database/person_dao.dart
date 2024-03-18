import 'package:floor/floor.dart';
import 'package:getmoney/database/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPeople();

  @Query('DELETE FROM Person WHERE id = :id')
  Future<bool?> deletePerson(int id);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertPerson(Person person);

  @Update(onConflict: OnConflictStrategy.ignore)
  Future<void> updateUser(Person person);

}
