import 'package:todo_r5_app/src/core/di/app_component.dart';
import 'package:todo_r5_app/src/core/enums/enums.dart';

void showErrorSheet(
  String message, {
  String? okButton,
  Function? okClick,
  bool oneButton = true,
}) async {
  await bottomSheetService.showCustomSheet(
    variant: DialogType.error,
    description: message,
    mainButtonTitle: 'Accept',
    isScrollControlled: true,
    barrierDismissible: false,
  );
  okClick?.call();
}

void showCreateTodoSheet({
  Function(Map<String, String> todoData)? primaryClick,
  Function? cancelFunction,
}) async {
  var sheetResponse = await bottomSheetService.showCustomSheet(
    title: 'Create a new TODO',
    description: 'In this menu you can create a new TODO',
    variant: DialogType.createTodo,
    isScrollControlled: true,
  );
  if (sheetResponse?.confirmed == true) {
    primaryClick?.call(sheetResponse?.data);
  } else {
    cancelFunction?.call();
  }
}
