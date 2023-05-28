import 'package:injectable/injectable.dart';
import 'package:todo_r5_app/src/home/api/datasource/home_local_source.dart';

@injectable
class HomeRepository {
  final HomeLocalSource _localDatasourceSource;

  @factoryMethod
  HomeRepository.from(this._localDatasourceSource);
}
