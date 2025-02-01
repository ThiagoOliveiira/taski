import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/utils.dart';
import '../presentation.dart';

class ExpansionItemWidget extends StatelessWidget {
  final int id;
  final bool isCompleted;
  final String title;
  final String description;
  final Function(bool?)? onChanged;

  const ExpansionItemWidget({super.key, required this.id, required this.isCompleted, required this.title, required this.description, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return ExpansionTile(
      title: Text(title, style: const TextStyle(color: AppColors.slatePurple, fontWeight: FontWeight.w600, fontSize: 16)),
      leading: Checkbox.adaptive(
        value: isCompleted,
        onChanged: onChanged,
        checkColor: AppColors.paleWhite,
        side: const BorderSide(color: AppColors.mutedAzure, width: 2.0, strokeAlign: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        activeColor: AppColors.mutedAzure,
        tristate: false,
      ),
      backgroundColor: AppColors.paleWhite,
      collapsedBackgroundColor: AppColors.paleWhite,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      collapsedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      trailing: InkWell(
        onTap: isCompleted ? () => todoCubit.removeTodo(id) : null,
        child: Icon(isCompleted ? Icons.delete : Icons.more_horiz_rounded, color: isCompleted ? Colors.red : null),
      ),
      iconColor: Colors.transparent,
      collapsedIconColor: AppColors.mutedAzure,
      childrenPadding: EdgeInsets.only(left: kBottomNavigationBarHeight, right: MediaQuery.sizeOf(context).width * 0.08, bottom: kDefaultFontSize),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            description,
            style: const TextStyle(color: AppColors.slateBlue, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
