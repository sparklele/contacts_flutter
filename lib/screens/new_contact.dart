import 'package:flutter/material.dart';
import 'package:flutter_contacts/data/models/person.dart';

import '../data/contacts_database.dart';

class AddOrUpdate extends StatelessWidget {
  final db = ContactsDatabase();

  AddOrUpdate(
      {super.key,
      required this.index,
      required this.nameController,
      required this.numberController,
      required this.emailController});

  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController emailController;
  final int index;

  void btOnTap(context) {
    if (nameController.text == "" ||
        numberController.text == "" ||
        emailController.text == "") {
      Navigator.pop(context);
    } else {
      final person = Person(
          name: nameController.text,
          number: numberController.text,
          email: emailController.text);
      if (index == -1) {
        db.addContact(person);
      } else {
        db.updateContact(index, person);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Add/Edit Contact",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: numberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16, // Position at the very bottom
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      btOnTap(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Save Contact',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
