import 'package:flutter/material.dart';
import 'contact_form.dart';
import '../models/contact.dart';
import '../widgets/contact_item.dart';
import '../app_colors.dart';

class ContactsList extends StatefulWidget {
  final List<Contact> _contacts = [];

  ContactsList({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactsListState();
  }
}

class ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.contactsPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: ListView.builder(
        itemCount: widget._contacts.length,
        itemBuilder: (context, i) {
          final contact = widget._contacts[i];
          return ContactItem(contact);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contact?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactForm();
          }));
          future.then((contactCreated) {
            if (contactCreated != null) {
              setState(() {
                widget._contacts.add(contactCreated);
              });
            }
          });
        },
        backgroundColor: AppColors.contactsPrimaryColor,
        child: const Icon(Icons.add_circle_rounded, size: 35, color: Colors.white),
      ),
    );
  }
}
