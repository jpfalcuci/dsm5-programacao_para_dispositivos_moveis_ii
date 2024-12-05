import 'package:flutter/material.dart';
import 'package:projeto_persistencia_sqlite/database/app_database.dart';
// import 'package:projeto_persistencia_sqlite/models/contact.dart';
// import 'package:projeto_persistencia_sqlite/screens/contacts_list.dart';
// import 'package:projeto_persistencia_sqlite/screens/contact_form.dart';
import 'package:projeto_persistencia_sqlite/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
  // save(Contact(0, 'Teste', 4321)).then((id){
  findAll().then((contacts) => debugPrint(contacts.toString()));
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}