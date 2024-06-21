import 'package:flutter/material.dart';
import 'HomePrincipal.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Coffee App",
      home: HomePrincipal(),
    );
  }
}
