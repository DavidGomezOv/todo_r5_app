import 'package:injectable/injectable.dart';
import 'package:todo_r5_app/src/core/base/base_reactive_service.dart';
import 'package:todo_r5_app/src/home/api/repository/home_repository.dart';

@lazySingleton
class HomeService extends BaseReactiveService {
  final HomeRepository _repository;

  @factoryMethod
  HomeService.from(this._repository) {
    listenToReactiveValues([
      loadingReactiveValue,
    ]);
  }
}
