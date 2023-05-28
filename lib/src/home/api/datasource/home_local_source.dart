import 'package:injectable/injectable.dart';

@lazySingleton
class HomeLocalSource {
  @factoryMethod
  HomeLocalSource.from();
}
