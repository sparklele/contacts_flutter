import 'package:flutter/material.dart';
import 'package:flutter_contacts/screens/home.dart';
import 'package:hive_flutter/adapters.dart';

import 'data/models/person.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
