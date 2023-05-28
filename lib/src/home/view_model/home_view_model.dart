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

  void onTodoTap(TodoModel todoModel) {}

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
    _homeService.createTodo(todoModel).then((value) {
      getTodos();
    }).catchError((error) {
      handleApiResponse(error.toString());
    });
  }

  void onSettingsTap() {
    _homeService.openOptions.value = !openOptions;
  }

  void onDeleteTodos() {
    _homeService.openOptions.value = !openOptions;
  }

  void onTodoCheckSelected(TodoModel todoModel) {
    todoModel.isSelected = !todoModel.isSelected;
    notifyListeners();
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerDescription.dispose();
    super.dispose();
  }
}
