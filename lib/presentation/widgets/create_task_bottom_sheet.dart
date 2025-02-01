import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/utils.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

Future<dynamic> createTaskBottomSheet({required BuildContext context, required TodoCubit cubit}) {
  return showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.white, builder: (context) => AddTodoBottomSheet(cubit: cubit));
}

class AddTodoBottomSheet extends StatefulWidget {
  final TodoCubit cubit;
  const AddTodoBottomSheet({super.key, required this.cubit});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  late TextEditingController titleEC;
  late TextEditingController descriptionEC;
  late bool isChecked;

  @override
  void initState() {
    titleEC = TextEditingController();
    descriptionEC = TextEditingController();
    isChecked = false;
    super.initState();
  }

  @override
  void dispose() {
    titleEC.dispose();
    descriptionEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: MediaQuery.sizeOf(context).width * 0.07,
            right: MediaQuery.sizeOf(context).width * 0.07,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox.adaptive(
                  value: isChecked,
                  onChanged: (bool? newValue) => setState(() => isChecked = newValue ?? false),
                  checkColor: AppColors.paleWhite,
                  side: const BorderSide(color: AppColors.mutedAzure, width: 2.0, strokeAlign: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: AppColors.mutedAzure,
                  tristate: false,
                ),
                title: TextFormField(
                  controller: titleEC,
                  decoration: const InputDecoration(
                    hintText: 'Add a title',
                    hintStyle: TextStyle(color: AppColors.mutedAzure),
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFormField(
                controller: descriptionEC,
                decoration: const InputDecoration(
                  hintText: 'Add a note',
                  icon: Icon(Icons.edit, color: AppColors.mutedAzure),
                  hintStyle: TextStyle(color: AppColors.mutedAzure),
                  border: InputBorder.none,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    await widget.cubit.createTodo(TodoEntity(title: titleEC.text, description: descriptionEC.text, isCompleted: isChecked));
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: const Text('Create', style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
