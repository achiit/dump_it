import 'package:flutter/material.dart';

class DumpsView extends StatelessWidget {
  const DumpsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dumps'),
      ),
      body: const Center(
        child: Text('Dumps View'),
      ),
    );
  }
}