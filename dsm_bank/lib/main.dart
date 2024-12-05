import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

void main() => runApp(const DSMBank());

class DSMBank extends StatelessWidget {
  const DSMBank({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}
