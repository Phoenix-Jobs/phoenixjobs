// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:get_it/get_it.dart';

import '../screens/main/main_viewmodel.dart';
import '../services/note/note_service.dart';
import '../services/rest.dart';
import '../services/note/note_service_mock.dart';
import '../services/note/note_service_rest.dart';

GetIt locator = GetIt.instance;

void initializeServiceLocator() {
  // Services
  // locator.registerLazySingleton<RestService>(
  //     () => RestService(baseUrl: 'http://192.168.0.5:3000'));

  //TODO To switch between service, comment out the line below accordingly
  locator.registerLazySingleton<NoteService>(() => NoteServiceMock());
  // locator.registerLazySingleton<NoteService>(() => NoteServiceRest());

  // Viewmodels
  locator.registerLazySingleton<MainViewmodel>(() => MainViewmodel());
}
