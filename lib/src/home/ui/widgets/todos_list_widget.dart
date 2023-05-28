import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_r5_app/src/home/ui/widgets/todo_list_item_widget.dart';
import 'package:todo_r5_app/src/home/view_model/home_view_model.dart';

class TodosListWidget extends ViewModelWidget<HomeViewModel> {
  const TodosListWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) =>
      ListView.builder(
        itemCount: viewModel.todosList.length,
        itemBuilder: (context, index) =>
            TodoListItemWidget(todoModel: viewModel.todosList[index]),
      );
}
