import 'package:flutter/material.dart';
import '../widgets/editor.dart';
import '../models/contact.dart';
import '../app_colors.dart';

class ContactForm extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerCpf = TextEditingController();
  
  ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Contato", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: AppColors.contactsPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: Column(
        children: [
          Editor(
            controller: _controllerName,
            label: 'Nome',
            hint: 'Walter White',
            icon: Icons.person,
            iconColor: AppColors.contactsPrimaryColor,
            keyboardType: TextInputType.text
          ),
          Editor(
            controller: _controllerAddress,
            label: 'Endereço',
            hint: 'Rua Heisenberg, 99',
            icon: Icons.house,
            iconColor: AppColors.contactsPrimaryColor,
            keyboardType: TextInputType.streetAddress
          ),
          Editor(
            controller: _controllerPhone,
            label: 'Telefone',
            hint: '(99) 99999-9999',
            icon: Icons.phone,
            iconColor: AppColors.contactsPrimaryColor,
            keyboardType: TextInputType.phone
          ),
          Editor(
            controller: _controllerEmail,
            label: 'E-mail',
            hint: 'heisenberg@bluecristal.bad',
            icon: Icons.email,
            iconColor: AppColors.contactsPrimaryColor,
            keyboardType: TextInputType.emailAddress
          ),
          Editor(
            controller: _controllerCpf,
            label: 'CPF',
            hint: '999.999.999-99',
            icon: Icons.badge,
            iconColor: AppColors.contactsPrimaryColor,
            keyboardType: TextInputType.number
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _createContact(
                context,
                _controllerName,
                _controllerAddress,
                _controllerPhone,
                _controllerEmail,
                _controllerCpf
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.contactsPrimaryColor,
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
            ),
            child: const Text(
              'Adicionar',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
      ),
    );
  }

  void _createContact(
      BuildContext context,
      TextEditingController controllerName,
      TextEditingController controllerAddress,
      TextEditingController controllerPhone,
      TextEditingController controllerEmail,
      TextEditingController controllerCpf
    ) {
    final String name = controllerName.text;
    final String address = controllerAddress.text;
    final String phone = controllerPhone.text;
    final String email = controllerEmail.text;
    final String cpf = controllerCpf.text;

    if(name.isEmpty || address.isEmpty || phone.isEmpty || email.isEmpty || cpf.isEmpty) return;
    
    final contact = Contact(name, address, phone, email, cpf);
    Navigator.pop(context, contact);
  }
}
