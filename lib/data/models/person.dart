import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
class Person{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String number;
  @HiveField(2)
  final String email;

  Person({required this.name, required this.number, required this.email});
}