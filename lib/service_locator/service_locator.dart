// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:get_it/get_it.dart';
import 'package:phoenixjobs/screens/app/auth/login_viewmodel.dart';
import 'package:phoenixjobs/services/authentication/authentication_service.dart';

//import '../screens/main/main_viewmodel.dart';
//import '../services/rest.dart';
import '../services/user/user_repository.dart';
import '../services/authentication/auth.dart';

GetIt locator = GetIt.instance;

class Value {
  // ignore: prefer_typing_uninitialized_variables
  final value;
  Value(this.value);
}

void initializeServiceLocator() {
  // Services
  // locator.registerLazySingleton<RestService>(
  //     () => RestService(baseUrl: 'http://192.168.0.5:3000'));

  //TODO To switch between service, comment out the line below accordingly
  //locator.registerLazySingleton<NoteService>(() => NoteServiceMock());
  // locator.registerLazySingleton<NoteService>(() => NoteServiceRest());
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceFirebase());

  // Viewmodels
  //locator.registerLazySingleton<MainViewmodel>(() => MainViewmodel());

  // Repositories
  locator.registerLazySingleton<UserRepository>(() => UserRepository());

  // Viewmodels
  locator.registerLazySingleton<LoginViewmodel>(() => LoginViewmodel());
}
