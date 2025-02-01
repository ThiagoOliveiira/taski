import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taski/core/utils/app_colors.dart';

class NavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationShell({super.key, required this.navigationShell});

  List<({String path, String label})> get _items => [
        (path: 'lib/assets/icons/todo.svg', label: 'Todo'),
        (path: 'lib/assets/icons/plus.svg', label: 'Create'),
        (path: 'lib/assets/icons/search.svg', label: 'Search'),
        (path: 'lib/assets/icons/checked.svg', label: 'Done'),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.085,
        child: BottomNavigationBar(
          items: _items.mapIndexed((index, item) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item.path,
                colorFilter: ColorFilter.mode(
                  index == navigationShell.currentIndex ? AppColors.blue : AppColors.mutedAzure,
                  BlendMode.srcIn,
                ),
              ),
              label: item.label,
            );
          }).toList(),
          selectedLabelStyle: const TextStyle(color: AppColors.blue, fontSize: 14, fontWeight: FontWeight.w600, height: 2),
          unselectedLabelStyle: const TextStyle(color: AppColors.mutedAzure, fontSize: 14, fontWeight: FontWeight.w600, height: 2),
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.mutedAzure,
          onTap: navigationShell.goBranch,
          currentIndex: navigationShell.currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.paleWhite,
        ),
      ),
      body: navigationShell,
    );
  }
}
