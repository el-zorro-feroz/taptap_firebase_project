import 'package:dartz/dartz.dart';
import 'package:taptapfirebase/core/usecase/usecase.dart';

class GetServerTextUseCase extends UseCase<String, Unit> {
  @override
  Future<Either<Error, String>> call(Unit params) async {
    return const Right('All good');
  }
}
