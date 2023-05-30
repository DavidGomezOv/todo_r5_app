import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
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
                : viewModel.showTodoDetail(context, todoModel),
            onLongPress: () => viewModel.onTodoLongTap(todoModel),
            child: SizedBox(
              height: 132,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          todoModel.title ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            decoration: todoModel.completed!
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          todoModel.description ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            decoration: todoModel.completed!
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        todoModel.translatedTitle != null
                            ? Text(
                                todoModel.translatedTitle ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  decoration: todoModel.completed!
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              )
                            : Shimmer.fromColors(
                                baseColor: Colors.black12,
                                highlightColor: Colors.black26,
                                child: Container(
                                  width: 200,
                                  height: 16,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                        const SizedBox(
                          height: 2,
                        ),
                        todoModel.translatedDescription != null
                            ? Text(
                                todoModel.translatedDescription ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  decoration: todoModel.completed!
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              )
                            : Shimmer.fromColors(
                                baseColor: Colors.black12,
                                highlightColor: Colors.black26,
                                child: Container(
                                  width: double.infinity,
                                  height: 14,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                      ],
                    ),
                  ),
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
