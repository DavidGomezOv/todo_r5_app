import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_r5_app/src/core/base/base_reactive_service.dart';
import 'package:todo_r5_app/src/home/api/repository/home_repository.dart';
import 'package:todo_r5_app/src/home/model/todo_model.dart';

@lazySingleton
class HomeService extends BaseReactiveService {
  final HomeRepository _repository;

  final openOptions = ReactiveValue<bool>(false);
  final todosList = ReactiveValue<List<TodoModel>>([]);
  final todosToDeleteList = ReactiveValue<List<TodoModel>>([]);
  StreamSubscription<dynamic>? streamSubscription;

  @factoryMethod
  HomeService.from(this._repository) {
    listenToReactiveValues([
      loadingReactiveValue,
      openOptions,
      todosList,
      todosToDeleteList,
    ]);
  }

  Future<dynamic> getTodosStream() async {
    streamSubscription?.cancel();
    loadingReactiveValue.value = true;
    final stream = await _repository.getTodosStream();
    streamSubscription = stream.listen((event) {
      todosList.value.clear();
      notifyListeners();
      loadingReactiveValue.value = false;
      List<TodoModel> todos = [];
      for (var e in event.docs) {
        todos.add(TodoModel.fromJson(e.data()));
      }
      final List<TodoModel> completedItems = [];
      if (todos.isNotEmpty) {
        for (final element in todos) {
          if (element.completed!) {
            completedItems.add(element);
          } else {
            todosList.value.add(element);
          }
        }
        completedItems.sort(
          (a, b) => b.creationDate!.compareTo(a.creationDate!),
        );
        todosList.value.sort(
          (a, b) => b.creationDate!.compareTo(a.creationDate!),
        );
      }
      todosList.value.addAll(completedItems);
    });
  }

  Future<void> saveTodo(TodoModel todoModel) async {
    loadingReactiveValue.value = true;
    return _repository
        .saveTodo(todoModel)
        .whenComplete(() => loadingReactiveValue.value = false);
  }

  Future<void> deleteTodos(List<TodoModel?> todos) async {
    loadingReactiveValue.value = true;
    return _repository
        .deleteTodos(todos)
        .whenComplete(() => loadingReactiveValue.value = false);
  }
}
