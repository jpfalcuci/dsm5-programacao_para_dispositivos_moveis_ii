import 'package:flutter/material.dart';
import 'package:projeto_persistencia_sqlite/database/app_database.dart';
import 'package:projeto_persistencia_sqlite/models/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 48, 92, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Novo Contato',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
              ),
              style: const TextStyle(fontSize: 24),
            ),
            TextField(
              controller: _accountNumberController,
              decoration: const InputDecoration(
                labelText: 'Número da Conta',
              ),
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 48, 92, 1),
                    textStyle: const TextStyle(fontSize: 24),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Cadastrar',
                  ),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, accountNumber!);
                    save(newContact).then((id) => Navigator.pop(context, newContact));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
