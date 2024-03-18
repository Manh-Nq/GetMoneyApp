import 'package:flutter/cupertino.dart';
import 'package:getmoney/database/app_database.dart';
import 'package:getmoney/database/person.dart';

class MainNotifier extends ChangeNotifier {
  final AppDatabase database;

  MainNotifier({
    required this.database,
  });

  List<Person>? persons;

  void loadData() async {
    persons = await database.personDao.findAllPeople();
    notifyListeners();
  }

  Future<void> addPerson({required Person person}) async {
    await database.personDao.insertPerson(person);

    persons = await database.personDao.findAllPeople();
    notifyListeners();
  }

  Future<void> updatePerson({required Person person}) async {
    await database.personDao.updateUser(person);

    persons = await database.personDao.findAllPeople();
    notifyListeners();
  }

  Future<void> deletePersonById({required int id}) async {
    await database.personDao.deletePerson(id);

    persons = await database.personDao.findAllPeople();
    notifyListeners();
  }
}
