import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_r5_app/firebase_options.dart';
import 'package:todo_r5_app/routes.dart';
import 'package:todo_r5_app/src/core/di/app_component.dart';
import 'package:todo_r5_app/src/core/dialogs/error_bottom_sheet.dart';
import 'package:todo_r5_app/src/core/enums/enums.dart';

void main() async {
  configureGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _setupBottomSheetUi();
  runApp(const MyApp());
}

void _setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();
  final builders = {
    DialogType.error: (context, sheetRequest, completer) =>
        ErrorBottomSheet(request: sheetRequest, completer: completer),
  };
  bottomSheetService.setCustomSheetBuilders(builders);
}

final appNavigatorKey = StackedService.navigatorKey;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      title: 'TODO R5 APP',
      initialRoute: Routes.home,
      navigatorKey: appNavigatorKey,
      routes: Routes.routes,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
