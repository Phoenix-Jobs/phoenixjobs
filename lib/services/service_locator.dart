// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:get_it/get_it.dart';
import 'package:phoenixjobs/screens/app/auth/auth_viewmodel.dart';
import 'package:phoenixjobs/screens/app/auth/judge_user_type_viewmodel.dart';
import 'package:phoenixjobs/screens/app/student/dashboard/dashboard_viewmodel.dart';
import 'package:phoenixjobs/services/auth/auth_service_firebase.dart';
import 'package:phoenixjobs/services/auth/auth_service.dart';
import 'package:phoenixjobs/services/user/user_repository.dart';
import 'package:phoenixjobs/services/user/user_service.dart';
import 'package:phoenixjobs/services/user/user_service_firebase.dart';

GetIt locator = GetIt.instance;

class Value {
  // ignore: prefer_typing_uninitialized_variables
  final value;
  Value(this.value);
}

void initializeServiceLocator() {
  /***** Services *****/
  locator.registerLazySingleton<AuthenticationService>(
    () => AuthenticationServiceFirebase(),
  );
  locator.registerLazySingleton<UserService>(
    () => UserServiceFirebase(),
  );

  /***** Repositories *****/
  locator.registerLazySingleton<UserRepository>(
    () => UserRepository(),
  );

  /***** ViewModels *****/
  locator.registerLazySingleton<AuthViewmodel>(
    () => AuthViewmodel(),
  );
  locator.registerLazySingleton<DashboardViewmodel>(
    () => DashboardViewmodel(),
  );
  locator.registerLazySingleton<JudgeUserTypeViewmodel>(
    () => JudgeUserTypeViewmodel(),
  );
}
