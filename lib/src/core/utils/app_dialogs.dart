import 'package:flutter/material.dart';
import 'package:todo_r5_app/src/core/di/app_component.dart';
import 'package:todo_r5_app/src/core/dialogs/todo_detail_center_sheet.dart';
import 'package:todo_r5_app/src/core/enums/enums.dart';
import 'package:todo_r5_app/src/home/model/todo_model.dart';

void showErrorSheet(
  String message, {
  String? title,
  String? okButton,
  Function? okClick,
  bool oneButton = true,
}) async {
  await bottomSheetService.showCustomSheet(
    variant: DialogType.error,
    title: title,
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

void showInformativeDialog({
  required String title,
  required String message,
  Function? primaryClick,
  Function? secondaryClick,
}) async {
  final sheetResponse = await bottomSheetService.showCustomSheet(
    variant: DialogType.informative,
    title: title,
    description: message,
    mainButtonTitle: 'Accept',
    secondaryButtonTitle: 'Cancel',
  );
  switch (sheetResponse?.confirmed) {
    case true:
      primaryClick?.call();
      break;
    case false:
      secondaryClick?.call();
      break;
  }
}

void showTodoDetailDialog({
  required BuildContext context,
  required TodoModel todoModel,
}) async {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: 'Dismissible',
    context: context,
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(animation),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: TodoDetailCenterSheet(
        todoModel: todoModel,
      ),
    ),
  );
}
