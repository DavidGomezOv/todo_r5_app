import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_r5_app/src/core/base/base_screen.dart';
import 'package:todo_r5_app/src/home/ui/widgets/todos_list_widget.dart';
import 'package:todo_r5_app/src/home/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => BaseScreen(
        onBackPressed: () async {
          viewModel.onSettingsTap();
          return false;
        },
        loading: viewModel.loading,
        baseColor: Colors.white,
        appBar: AppBar(
          title: viewModel.openOptions
              ? IconButton(
                  onPressed: viewModel.onSettingsTap,
                  icon: const Icon(Icons.arrow_back),
                )
              : const Text('TODO App'),
          actions: [
            IconButton(
              onPressed: viewModel.openOptions
                  ? viewModel.areTodosToDelete
                      ? viewModel.onDeleteTodos
                      : null
                  : viewModel.onSettingsTap,
              icon: Icon(viewModel.openOptions
                  ? viewModel.areTodosToDelete
                      ? Icons.delete
                      : null
                  : Icons.more_horiz),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            viewModel.getTodos();
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: viewModel.todosList.isNotEmpty
                ? const TodosListWidget()
                : const Center(
                    child: Text('TODO list empty, create one'),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.createTodo,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
