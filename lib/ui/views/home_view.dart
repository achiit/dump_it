import 'package:dump_it/ui/shared/widgets/custom_navbar.dart';
import 'package:dump_it/ui/views/allcommunities_view.dart';
import 'package:dump_it/ui/views/dumps_view.dart';
import 'package:dump_it/ui/views/message_view.dart';
import 'package:dump_it/ui/views/newpost_view.dart';
import 'package:dump_it/ui/views/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _views = [
   const DumpsView(),
   const AllCommunitiesView(),
   const NewPostView(),
   const MessageView(),
   const ProfileView()
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}