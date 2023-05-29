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

  @factoryMethod
  HomeService.from(this._repository) {
    listenToReactiveValues([
      loadingReactiveValue,
      openOptions,
      todosList,
      todosToDeleteList,
    ]);
  }

  Future<dynamic> getTodos() async {
    loadingReactiveValue.value = true;
    return _repository.getTodos().then((value) {
      if (value is List<TodoModel>) {
        if (value.isNotEmpty) {
          value.sort(
            (a, b) => b.creationDate!.compareTo(a.creationDate!),
          );
          value.sort(
            (a, b) => !b.completed! ? 1 : -1,
          );
        }
        todosList.value = value;
      }
    }).whenComplete(() => loadingReactiveValue.value = false);
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
