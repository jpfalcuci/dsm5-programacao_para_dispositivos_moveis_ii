import 'package:flutter/material.dart';
import '../models/transfer.dart';
import '../app_colors.dart';

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(this._transfer, {super.key});

  @override
  Widget build(BuildContext context) {
    final String transfer = _transfer.value.toString().replaceAll(".", ",");
    
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on, color: AppColors.transfersPrimaryColor),
        title: Text('R\$ $transfer'),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
