import 'package:dartz/dartz.dart';
import 'package:taptapfirebase/core/usecase/usecase.dart';
import 'package:taptapfirebase/src/domain/repositories/info_repository.dart';

///
///
///
class SyncInfoUseCase extends UseCase<Unit, Unit> {
  final InfoRepository repository;

  SyncInfoUseCase({
    required this.repository,
  });

  @override
  Future<Either<Error, Unit>> call(Unit params) {
    return repository.syncInfo();
  }
}
