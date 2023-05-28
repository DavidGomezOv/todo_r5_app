import 'package:stacked/stacked.dart';
import 'package:todo_r5_app/src/core/base/base_view_model.dart';
import 'package:todo_r5_app/src/core/di/app_component.dart';
import 'package:todo_r5_app/src/home/services/home_service.dart';

class HomeViewModel extends AppBaseViewModel {
  final _homeService = locator<HomeService>();

  bool get loading => _homeService.loadingReactiveValue.value;

  HomeViewModel();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _homeService,
      ];
}
