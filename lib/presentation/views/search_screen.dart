import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski/domain/domain.dart';

import '../../core/utils/utils.dart';
import '../presentation.dart';

class SearchScreen extends StatefulWidget {
  final List<TodoEntity> todos;

  const SearchScreen({super.key, required this.todos});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();

    final List<TodoEntity> filteredTodos = widget.todos.where((todo) => todo.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    return Column(
      children: [
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search task',
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.blue)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.blue)),
            fillColor: AppColors.paleWhite,
            filled: true,
            prefixIcon: const Icon(Icons.search, color: AppColors.blue),
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    searchController.clear();
                    _searchQuery = '';
                  });
                },
                child: const Icon(Icons.cancel, color: AppColors.mutedAzure)),
          ),
          onChanged: (query) => setState(() => _searchQuery = query),
        ),
        filteredTodos.isEmpty && _searchQuery.isNotEmpty
            ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('lib/assets/images/undraw_no_data_re_kwbl.svg'),
                    const SizedBox(height: 20),
                    const Text('No result found.', style: TextStyle(color: AppColors.slateBlue, fontWeight: FontWeight.w500)),
                  ],
                ),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: filteredTodos.isEmpty ? 0 : filteredTodos.length,
                  itemBuilder: (context, index) {
                    final todo = filteredTodos[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10, top: index == 0 ? 10 : 0),
                      child: ExpansionItemWidget(
                        id: todo.id ?? 0,
                        title: todo.title,
                        description: todo.description,
                        isCompleted: todo.isCompleted ?? false,
                        onChanged: (value) => todoCubit.modifyTodo(TodoEntity(id: todo.id, title: todo.title, description: todo.description, isCompleted: value)),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
