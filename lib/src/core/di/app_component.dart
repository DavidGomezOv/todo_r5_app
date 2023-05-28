import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_r5_app/src/core/di/app_component.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
  initializerName: r'$appInitGetIt',
)
void configureGetIt() => locator.$appInitGetIt();

final bottomSheetService = locator<BottomSheetService>();