import 'package:get_it/get_it.dart';
import 'package:ibom_tour/pages/base/base.vm.dart';


final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register your view models or services here
  getIt.registerLazySingleton(() => BaseViewModel());
}
