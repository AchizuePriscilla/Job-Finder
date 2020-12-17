import 'package:get_it/get_it.dart';
import 'package:sca_ui/services/authentication_service.dart';
import 'package:sca_ui/services/firestore_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(()=> AuthenticationService(),);
  locator.registerLazySingleton(()=> FirestoreService(),);
}
