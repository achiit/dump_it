import 'package:flutter/material.dart';

class AllCommunitiesView extends StatelessWidget {
  const AllCommunitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllCommunities'),
      ),
      body: const Center(
        child: Text('AllCommunities View'),
      ),
    );
  }
}