import 'package:injectable/injectable.dart';
import 'package:todo_r5_app/src/home/api/datasource/home_data_source.dart';
import 'package:todo_r5_app/src/home/model/todo_model.dart';

@injectable
class HomeRepository {
  final HomeDataSource _homeDataSource;

  @factoryMethod
  HomeRepository.from(this._homeDataSource);

  Future<dynamic> getTodos() {
    return _homeDataSource.getTodos();
  }

  Future<void> createTodo(TodoModel todoModel) {
    return _homeDataSource.createTodo(todoModel);
  }
}
