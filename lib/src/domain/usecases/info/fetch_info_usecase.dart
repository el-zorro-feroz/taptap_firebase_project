import 'package:dartz/dartz.dart';
import 'package:taptapfirebase/core/usecase/usecase.dart';
import 'package:taptapfirebase/src/domain/entities/user_info.dart';
import 'package:taptapfirebase/src/domain/repositories/info_repository.dart';

///
///
///
///
class FetchInfoUseCase extends UseCase<UserInfo, Unit> {
  final InfoRepository repository;

  FetchInfoUseCase({
    required this.repository,
  });

  @override
  Future<Either<Error, UserInfo>> call(Unit params) {
    return repository.fetchInfo();
  }
}
