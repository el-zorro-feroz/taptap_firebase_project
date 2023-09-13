import 'package:dartz/dartz.dart';
import 'package:taptapfirebase/src/domain/entities/user_info.dart';

abstract class InfoRepository {
  Future<Either<Error, UserInfo>> fetchInfo();
  Future<Either<Error, Unit>> syncInfo();
}
