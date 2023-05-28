// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;
import 'package:todo_r5_app/src/core/di/helper_module.dart' as _i7;
import 'package:todo_r5_app/src/home/api/datasource/home_data_source.dart'
    as _i4;
import 'package:todo_r5_app/src/home/api/repository/home_repository.dart'
    as _i5;
import 'package:todo_r5_app/src/home/services/home_service.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $appInitGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final helperModule = _$HelperModule();
    gh.lazySingleton<_i3.BottomSheetService>(
        () => helperModule.bottomSheetService);
    gh.lazySingleton<_i4.HomeDataSource>(() => _i4.HomeDataSource.from());
    gh.factory<_i5.HomeRepository>(
        () => _i5.HomeRepository.from(gh<_i4.HomeDataSource>()));
    gh.lazySingleton<_i6.HomeService>(
        () => _i6.HomeService.from(gh<_i5.HomeRepository>()));
    return this;
  }
}

class _$HelperModule extends _i7.HelperModule {
  @override
  _i3.BottomSheetService get bottomSheetService => _i3.BottomSheetService();
}
