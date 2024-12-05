import 'package:flutter/material.dart';
import 'transfer_form.dart';
import '../models/transfer.dart';
import '../widgets/transfer_item.dart';
import '../app_colors.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transfer> _transfers = [];

  ListaTransferencia({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.transfersPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transfers[indice];
          return TransferItem(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          future.then((transferReceived) {
            if (transferReceived != null) {
              setState(() {
                widget._transfers.add(transferReceived);
              });
            }
          });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_circle_rounded, size: 35, color: Colors.white),
      ),
    );
  }
}
