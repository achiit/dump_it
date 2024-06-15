import 'package:dump_it/ui/shared/colors.dart';
import 'package:dump_it/ui/shared/widgets/custom_navbar.dart';
import 'package:dump_it/ui/views/allcommunities_view.dart';
import 'package:dump_it/ui/views/dumps_view.dart';
import 'package:dump_it/ui/views/message_view.dart';
import 'package:dump_it/ui/views/newpost_view.dart';
import 'package:dump_it/ui/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

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

  void _onRiveInit(Artboard artboard) {
    final StateMachineController? controller =
        StateMachineController.fromArtboard(
      artboard,
      'Chatbot State Machine', // Replace with your state machine name
    );
    if (controller != null) {
      artboard.addController(controller);
      SMIBool? idleInput = controller.findInput<bool>('Idle') as SMIBool?;
      idleInput?.change(true); // Ensure the animation stays in the "Idle" state
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _views[_currentIndex],
        floatingActionButton: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 15.0,
                spreadRadius: 10.0,
                offset: const Offset(
                  0.0,
                  5.0,
                ),
              ),
            ],
          ),
          height: 9.h,
          width: 9.h,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(),
              backgroundColor: Colors.transparent,
              child: RiveAnimation.asset(
                "assets/rive_assets/animated_chatbot.riv",
                onInit: _onRiveInit,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
          
              color: AppColors.primary,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: CustomNavBar(
              pages: [
                const DumpsView(),
                const AllCommunitiesView(),
                const NewPostView(),
                const MessageView(),
                const ProfileView()
              ],
              currentIndex: _currentIndex,
              onTap: _onTap,
            ),
          ),
        ));
  }
}
