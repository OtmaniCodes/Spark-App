import 'package:anas_cars/src/services/authentication/authentication_services.dart';
import 'package:get_it/get_it.dart';

final GetIt app = GetIt.instance;

void setupLocator() {
  app..registerLazySingleton<AuthServices>(() => AuthServices());
}
