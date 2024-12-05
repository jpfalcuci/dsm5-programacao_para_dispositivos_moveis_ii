import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;

  const ItemDashboard({
    super.key, 
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(16),
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.white
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
