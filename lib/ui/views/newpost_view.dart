import 'package:flutter/material.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewPost'),
      ),
      body: const Center(
        child: Text('NewPost View'),
      ),
    );
  }
}