import 'package:flutter_contacts/data/models/person.dart';
import 'package:hive/hive.dart';

class ContactsDatabase {
  final _myBox = Hive.box<Person>('contacts');

  void addContact(Person person) {
    _myBox.add(person);
  }

  List<Person> getContacts() {
    return _myBox.isNotEmpty ? _myBox.values.toList() : [];
  }

  void updateContact(int index, Person person) {
    _myBox.putAt(index, person);
  }

  void deleteContact(int index) {
    _myBox.deleteAt(index);
  }
}
