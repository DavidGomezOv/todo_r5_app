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
  Widget build(BuildContext context, HomeViewModel viewModel) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: viewModel.openOptions ? Colors.grey : Colors.blueAccent,
          ),
          child: InkWell(
            onTap: () => viewModel.openOptions
                ? viewModel.onTodoDeleteCheckSelected(todoModel)
                : null,
            onLongPress: () => viewModel.onTodoLongTap(todoModel),
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: todoModel.completed! ? Colors.green : Colors.red,
                      width: 60,
                      height: double.infinity,
                      child: viewModel.openOptions
                          ? const SizedBox.shrink()
                          : Checkbox(
                              value: todoModel.completed,
                              onChanged: (value) => viewModel
                                  .onTodoCompletedCheckSelected(todoModel),
                            ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        todoModel.title ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        todoModel.description ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  viewModel.openOptions
                      ? Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                              value: todoModel.isSelected,
                              onChanged: (value) => viewModel
                                  .onTodoDeleteCheckSelected(todoModel)),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      );
}
