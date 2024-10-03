import 'package:flutter/material.dart';

import '../data/models/person.dart';

class ContactTile extends StatelessWidget {
  final Person person;
  final VoidCallback onTap;

  const ContactTile(
      {super.key,
      required this.person,
      required this.onTap});

  String getFirstChar() {
    return person.name[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          color: Colors.purpleAccent[100]?.withOpacity(0.2),
          // shadowColor: Colors.grey.withOpacity(0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  getFirstChar(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            title: Text(
              person.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            subtitle: Text(
              person.number,
              style: const TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
