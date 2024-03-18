import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:getmoney/database/app_database.dart';
import 'package:getmoney/database/person.dart';

class MainNotifier extends ChangeNotifier {
  final AppDatabase database;

  MainNotifier({
    required this.database,
  });

  List<Person> _persons = [];

  UnmodifiableListView<Person> get persons => UnmodifiableListView(_persons);

  Person? get largestPerson => personWithLargestPointer(persons);

  Person? get smallestPerson =>
      personWithLargestPointer(persons, isLargest: false);

  void loadData() async {
    _persons = await database.personDao.findAllPeople();
    notifyListeners();
  }

  Future<void> addPerson({required Person person}) async {
    await database.personDao.insertPerson(person);

    _persons = await database.personDao.findAllPeople();
    notifyListeners();
  }

  Future<void> updatePerson({required Person person}) async {
    await database.personDao.updateUser(person);

    _persons = await database.personDao.findAllPeople();
    notifyListeners();
  }

  Future<void> deletePersonById({required int id}) async {
    await database.personDao.deletePerson(id);

    _persons = await database.personDao.findAllPeople();
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await database.personDao.deleteAll();

    _persons = await database.personDao.findAllPeople();
    notifyListeners();
  }

  Person? personWithLargestPointer(
    List<Person>? persons, {
    bool isLargest = true,
  }) {
    if (persons == null || persons.isEmpty) {
      return null;
    }

    Person maxPointerPerson = persons.first;
    int maxPointer = maxPointerPerson.pointer;

    for (var person in persons) {
      if (isLargest) {
        if (person.pointer > maxPointer) {
          maxPointer = person.pointer;
          maxPointerPerson = person;
        }
      } else {
        if (person.pointer < maxPointer) {
          maxPointer = person.pointer;
          maxPointerPerson = person;
        }
      }
    }

    return maxPointerPerson;
  }
}
