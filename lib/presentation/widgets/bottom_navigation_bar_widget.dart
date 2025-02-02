// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/utils.dart';
import '../presentation.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  List<({String path, String label})> get _items => [
        (path: 'lib/assets/icons/todo.svg', label: 'Todo'),
        (path: 'lib/assets/icons/plus.svg', label: 'Create'),
        (path: 'lib/assets/icons/search.svg', label: 'Search'),
        (path: 'lib/assets/icons/checked.svg', label: 'Done'),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return BottomNavigationBar(
          elevation: 10,
          items: _items.mapIndexed((index, item) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: SvgPicture.asset(
                  item.path,
                  colorFilter: ColorFilter.mode(index == state.menuIndex ? AppColors.blue : AppColors.mutedAzure, BlendMode.srcIn),
                ),
              ),
              label: item.label,
            );
          }).toList(),
          selectedLabelStyle: const TextStyle(color: AppColors.blue, fontSize: 14, fontWeight: FontWeight.w600, height: 2),
          unselectedLabelStyle: const TextStyle(color: AppColors.mutedAzure, fontSize: 14, fontWeight: FontWeight.w600, height: 2),
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.mutedAzure,
          onTap: (index) {
            context.read<TodoCubit>().navigateBottomSheetItem(index);
            if (index == 1) {
              createTaskBottomSheet(context: context, cubit: context.read<TodoCubit>());
              context.read<TodoCubit>().navigateBottomSheetItem(0);
            }
          },
          currentIndex: state.menuIndex ?? 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.paleWhite,
        );
      },
    );
  }
}
