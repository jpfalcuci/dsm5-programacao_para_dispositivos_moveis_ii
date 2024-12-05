import 'package:flutter/material.dart';
import 'contacts_list.dart';
import 'transfers_list.dart';
import '../widgets/dashboard_item.dart';
import '../app_colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.appBarTextColor),),
        backgroundColor: AppColors.appBarBgColor,
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ItemDashboard(
            title: "Transferências",
            icon: Icons.monetization_on,
            bgColor: AppColors.transfersPrimaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaTransferencia()),
              );
            },
          ),
          ItemDashboard(
            title: "Contatos",
            icon: Icons.people,
            bgColor: AppColors.contactsPrimaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactsList()),
              );
            },
          ),
        ],
      ),
    );
  }
}
