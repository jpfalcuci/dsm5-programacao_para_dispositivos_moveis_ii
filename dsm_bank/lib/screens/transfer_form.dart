import 'package:flutter/material.dart';
import '../widgets/editor.dart';
import '../models/transfer.dart';
import '../app_colors.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerAccountNumber = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  TransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Transferência", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: AppColors.transfersPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: Column(
        children: [
          Editor(
            controller: _controllerAccountNumber,
            label: 'Número da conta',
            hint: '0000',
            icon: Icons.account_balance,
            iconColor: AppColors.transfersPrimaryColor,
            keyboardType: TextInputType.number
          ),
          Editor(
            controller: _controllerValue,
            label: 'Valor',
            hint: '000.00',
            icon: Icons.monetization_on,
            iconColor: AppColors.transfersPrimaryColor,
            keyboardType: TextInputType.number
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _createTransfer(
                context,
                _controllerAccountNumber,
                _controllerValue
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.transfersPrimaryColor,
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
            ),
            child: const Text(
              'Confirmar',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
      ),
    );
  }

  void _createTransfer(
      BuildContext context,
      TextEditingController controllerAccountNumber,
      TextEditingController controllerValue
    ) {
    final int? accountNumber = int.tryParse(controllerAccountNumber.text);
    final double? value = double.tryParse(controllerValue.text);

    if(accountNumber == null || value == null) return;
    
    final createdTransfer = Transfer(accountNumber, value);
    Navigator.pop(context, createdTransfer);
  }
}
