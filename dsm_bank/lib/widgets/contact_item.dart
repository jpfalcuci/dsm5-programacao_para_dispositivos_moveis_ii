import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../app_colors.dart';

class ContactItem extends StatelessWidget {
  final Contact _contact;

  const ContactItem(this._contact, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person, color: AppColors.contactsPrimaryColor),
        title: Text('Nome: ${_contact.name}', style: const TextStyle(fontSize: 18.0)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Endereço: ${_contact.address}'),
            Text('Telefone: ${_contact.phone}'),
            Text('E-mail: ${_contact.email}'),
            Text('CPF: ${_contact.cpf}'),
          ],
        ),
      ),
    );
  }
}
