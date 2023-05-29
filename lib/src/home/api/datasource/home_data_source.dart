import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_r5_app/src/core/base/base_datasource.dart';
import 'package:todo_r5_app/src/core/constants/constants.dart';
import 'package:todo_r5_app/src/home/model/todo_model.dart';

@lazySingleton
class HomeDataSource extends BaseDatasource {
  @factoryMethod
  HomeDataSource.from();

  Future<dynamic> getTodos() async {
    await validateConnection();
    final firebase = FirebaseFirestore.instance;
    final data = await firebase.collection(Constants.todosCollection).get();
    return data.docs.map((e) => TodoModel.fromJson(e.data())).toList();
  }

  Future<void> saveTodo(TodoModel todoModel) async {
    await validateConnection();
    final firebase = FirebaseFirestore.instance;
    firebase
        .collection(Constants.todosCollection)
        .doc(todoModel.id)
        .set(todoModel.toJson());
  }

  Future<void> deleteTodos(List<TodoModel?> todos) async {
    await validateConnection();
    final firebase = FirebaseFirestore.instance;
    for (var element in todos) {
      await firebase
          .collection(Constants.todosCollection)
          .doc(element?.id)
          .delete();
    }
  }
}
