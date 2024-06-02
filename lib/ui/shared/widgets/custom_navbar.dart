import 'package:dump_it/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.primary,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? Colors.white : Colors.grey,
            ),
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            onPressed: () => onTap(1),
          ),
          const SizedBox.shrink(), // Space for the middle bulged button
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: currentIndex == 3 ? Colors.white : Colors.grey,
            ),
            onPressed: () => onTap(3),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: currentIndex == 4 ? Colors.white : Colors.grey,
            ),
            onPressed: () => onTap(4),
          ),
        ],
      ),
    );
  }
}