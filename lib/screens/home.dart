import 'package:flutter/material.dart';
import 'package:flutter_contacts/components/contact.dart';
import 'package:flutter_contacts/screens/new_contact.dart';
import 'package:hive/hive.dart';

import '../data/models/person.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Person> contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  void _loadContacts() async {
    var box = await Hive.openBox<Person>('contacts');
    setState(() {
      contacts = box.values.toList();
    });
  }

  floatingOnPressed(context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController numberController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddOrUpdate(
                nameController: nameController,
                numberController: numberController,
                emailController: emailController,
                index: -1,
              )),
    ).then((value) => _loadContacts());
  }

  void contactOnPressed(
      context, String name, String number, String email, int index) {
    final TextEditingController nameController =
        TextEditingController(text: name);
    final TextEditingController numberController =
        TextEditingController(text: number);
    final TextEditingController emailController =
        TextEditingController(text: email);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddOrUpdate(
                nameController: nameController,
                numberController: numberController,
                emailController: emailController,
                index: index,
              )),
    ).then((value) => _loadContacts());
  }

  /*

  final List contacts = [
    Person(
      name: "Yasmine",
      number: "01225016429",
      email: 'yas@gmail.com',
    ),
    Person(name: "Maya", number: "01133446677", email: "maya@gmail.com"),
    Person(name: "Tibyan", number: "01244668800", email: "tibyan@gmail.com")
  ];
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactTile(
              person: contacts[index],
              onTap: () {
                contactOnPressed(context, contacts[index].name,
                    contacts[index].number, contacts[index].email, index);
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => floatingOnPressed(context),
        backgroundColor: Colors.pink[600],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
