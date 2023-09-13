import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taptapfirebase/core/firebase/firebase_service.dart';
import 'package:taptapfirebase/src/data/datasource/local/device_info_datasource.dart';
import 'package:taptapfirebase/src/data/datasource/remote/firebase_datasource.dart';
import 'package:taptapfirebase/src/data/repositories/firebase_info_repository.dart';
import 'package:taptapfirebase/src/domain/repositories/info_repository.dart';
import 'package:taptapfirebase/src/domain/usecases/info/fetch_info_usecase.dart';
import 'package:taptapfirebase/src/domain/usecases/info/sync_info_usecase.dart';

final GetIt services = GetIt.I;

class InjectorService {
  Future<void> init() async {
    // Services
    services.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

    services.registerLazySingleton<DeviceInfoPlugin>(() => DeviceInfoPlugin());
    services.registerLazySingleton<FirebaseService>(() => FirebaseService());

    // Datasoruce
    services.registerLazySingleton<DeviceInfoDatasource>(
      () => DeviceInfoDatasource(
        deviceInfoPlugin: services<DeviceInfoPlugin>(),
      ),
    );

    services.registerLazySingleton<FirebaseDatasource>(
      () => FirebaseDatasource(
        firebaseFirestore: services<FirebaseFirestore>(),
      ),
    );

    // Repositories
    services.registerLazySingleton<InfoRepository>(
      () => FirebaseInfoRepository(
        deviceInfoDatasource: services<DeviceInfoDatasource>(),
        firebaseDatasource: services<FirebaseDatasource>(),
      ),
    );

    // Use Cases
    services.registerLazySingleton<FetchInfoUseCase>(
      () => FetchInfoUseCase(
        repository: services<InfoRepository>(),
      ),
    );

    services.registerLazySingleton(
      () => SyncInfoUseCase(
        repository: services<InfoRepository>(),
      ),
    );

    // Post Inject Process
    await services<FirebaseService>().init();
  }
}
