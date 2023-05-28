import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_r5_app/src/home/model/todo_model.dart';
import 'package:todo_r5_app/src/home/view_model/home_view_model.dart';

class TodoListItemWidget extends ViewModelWidget<HomeViewModel> {
  final TodoModel todoModel;

  const TodoListItemWidget({
    required this.todoModel,
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) => ListTile(
        trailing: viewModel.openOptions
            ? Transform.scale(
                scale: 1.3,
                child: Checkbox(
                    value: todoModel.isSelected,
                    onChanged: (value) =>
                        viewModel.onTodoCheckSelected(todoModel)),
              )
            : const SizedBox.shrink(),
        onTap: () => viewModel.openOptions
            ? viewModel.onTodoCheckSelected(todoModel)
            : viewModel.onTodoTap(todoModel),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: viewModel.openOptions ? Colors.grey : Colors.blueAccent,
        title: Text(
          todoModel.title ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          todoModel.description ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
