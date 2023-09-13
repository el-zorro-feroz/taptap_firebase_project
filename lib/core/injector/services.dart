import 'package:get_it/get_it.dart';
import 'package:taptapfirebase/core/firebase/firebase_service.dart';

final GetIt services = GetIt.I;

class InjectorService {
  Future<void> init() async {
    // Services
    services.registerLazySingleton<FirebaseService>(() => FirebaseService());

    // Post Inject Actions
    await services<FirebaseService>().init();
  }
}
