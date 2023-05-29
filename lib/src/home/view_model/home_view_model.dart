import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_r5_app/src/core/base/base_view_model.dart';
import 'package:todo_r5_app/src/core/constants/constants.dart';
import 'package:todo_r5_app/src/core/di/app_component.dart';
import 'package:todo_r5_app/src/core/utils/app_dialogs.dart';
import 'package:todo_r5_app/src/home/model/todo_model.dart';
import 'package:todo_r5_app/src/home/services/home_service.dart';

class HomeViewModel extends AppBaseViewModel {
  final _homeService = locator<HomeService>();

  bool get loading => _homeService.loadingReactiveValue.value;

  bool get openOptions => _homeService.openOptions.value;

  List<TodoModel> get todosList => _homeService.todosList.value;

  List<TodoModel?> get todosToDeleteList =>
      _homeService.todosToDeleteList.value;

  bool get areTodosToDelete => todosToDeleteList.isNotEmpty;

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  HomeViewModel() {
    getTodos();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _homeService,
      ];

  void getTodos() {
    _homeService.getTodos().catchError((error) {
      handleApiResponse(error.toString());
    });
  }

  void createTodo() {
    showCreateTodoSheet(
      primaryClick: (todoData) {
        final todoModel = TodoModel(
          DateTime.now().toString(),
          todoData[Constants.todoTitle],
          todoData[Constants.todoDescription],
          false,
          DateTime.now(),
        );
        saveTodo(todoModel);
      },
    );
  }

  void saveTodo(TodoModel todoModel) {
    _homeService.saveTodo(todoModel).then((value) {
      getTodos();
    }).catchError((error) {
      handleApiResponse(error.toString());
    });
  }

  void onTodoLongTap(TodoModel todoModel) {
    onSettingsTap();
    onTodoDeleteCheckSelected(todoModel);
  }

  void onSettingsTap() {
    if (openOptions) {
      for (var element in todosList) {
        element.isSelected = false;
      }
      _homeService.todosToDeleteList.value.clear();
    }
    _homeService.openOptions.value = !openOptions;
  }

  Future<void> onDeleteTodos() async {
    showInformativeDialog(
      title: 'Delete',
      message: 'Are you sure you want to delete the selected TODOs',
      primaryClick: () async {
        await _homeService.deleteTodos(todosToDeleteList).then((value) {
          _homeService.todosList.value = [];
          getTodos();
          _homeService.openOptions.value = !openOptions;
        }).catchError((error) {
          handleApiResponse(error.toString());
        });
      },
      secondaryClick: () => onSettingsTap(),
    );
  }

  void onTodoDeleteCheckSelected(TodoModel todoModel) {
    todoModel.isSelected = !todoModel.isSelected;
    notifyListeners();
    if (todoModel.isSelected) {
      _homeService.todosToDeleteList.value.add(todoModel);
    } else {
      _homeService.todosToDeleteList.value.remove(todoModel);
    }
    if (todosToDeleteList.isEmpty) {
      onSettingsTap();
    }
  }

  void onTodoCompletedCheckSelected(TodoModel todoModel) {
    showInformativeDialog(
      title: 'Mark as complete',
      message:
          'Are you sure you want to mark as ${todoModel.completed! ? 'uncompleted' : 'completed'} the selected TODO',
      primaryClick: () async {
        todoModel.completed = !todoModel.completed!;
        notifyListeners();
        saveTodo(todoModel);
      },
    );
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerDescription.dispose();
    super.dispose();
  }
}
