import 'package:injectable/injectable.dart';
import 'package:todo_r5_app/src/home/api/datasource/home_data_source.dart';

@injectable
class HomeRepository {
  final HomeDataSource _localDatasourceSource;

  @factoryMethod
  HomeRepository.from(this._localDatasourceSource);

  Future<dynamic> getTodos() {
    return _localDatasourceSource.getTodos();
  }
}
