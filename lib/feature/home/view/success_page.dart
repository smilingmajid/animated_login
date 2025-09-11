import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,

      body: const Center(
        child: Text(
          "Account has been successfully created 🎉",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
