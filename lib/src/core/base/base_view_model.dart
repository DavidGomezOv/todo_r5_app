import 'package:stacked/stacked.dart';
import 'package:todo_r5_app/src/core/utils/app_dialogs.dart';

abstract class AppBaseViewModel extends ReactiveViewModel {
  AppBaseViewModel();

  Future<void> handleApiResponse(dynamic exception, {Function? click}) async {
    showErrorSheet(
      exception.toString(),
      okClick: click,
    );
  }
}
