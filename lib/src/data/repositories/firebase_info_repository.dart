// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:taptapfirebase/src/data/datasource/local/device_info_datasource.dart';
import 'package:taptapfirebase/src/data/datasource/remote/firebase_datasource.dart';
import 'package:taptapfirebase/src/data/models/user_firebase_model.dart';
import 'package:taptapfirebase/src/domain/entities/user_info.dart';
import 'package:taptapfirebase/src/domain/repositories/info_repository.dart';

class FirebaseInfoRepository implements InfoRepository {
  final DeviceInfoDatasource deviceInfoDatasource;
  final FirebaseDatasource firebaseDatasource;

  FirebaseInfoRepository({
    required this.deviceInfoDatasource,
    required this.firebaseDatasource,
  });

  @override
  Future<Either<Error, UserInfo>> fetchInfo() async {
    try {
      final IosDeviceInfo iosDeviceInfo = await deviceInfoDatasource.getDeviceInfo();
      final UserInfo userInfo = UserInfo(
        name: iosDeviceInfo.name,
        model: iosDeviceInfo.model,
      );

      return Right(userInfo);
    } catch (_) {
      return Left(UnimplementedError());
    }
  }

  @override
  Future<Either<Error, Unit>> syncInfo() async {
    try {
      final Either<Error, UserInfo> info = await fetchInfo();

      return await info.fold(
        (error) => Left(UnimplementedError()),
        (info) async {
          final UserFirebaseModel userFirebaseModel = UserFirebaseModel(
            name: info.name,
            model: info.model,
            time: DateTime.now(),
          );

          await firebaseDatasource.sendData(userFirebaseModel);
          return const Right(unit);
        },
      );
    } catch (_) {
      return Left(UnimplementedError());
    }
  }
}
