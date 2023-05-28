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
import 'package:todo_r5_app/src/home/api/datasource/home_local_source.dart'
    as _i3;
import 'package:todo_r5_app/src/home/api/repository/home_repository.dart'
    as _i4;
import 'package:todo_r5_app/src/home/services/home_service.dart' as _i5;

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
    gh.lazySingleton<_i3.HomeLocalSource>(() => _i3.HomeLocalSource.from());
    gh.factory<_i4.HomeRepository>(
        () => _i4.HomeRepository.from(gh<_i3.HomeLocalSource>()));
    gh.lazySingleton<_i5.HomeService>(
        () => _i5.HomeService.from(gh<_i4.HomeRepository>()));
    return this;
  }
}
