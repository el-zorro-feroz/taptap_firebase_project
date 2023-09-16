import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:taptapfirebase/src/domain/usecases/get_server_text_usecase.dart';

@Singleton()
class ServerTextController with ChangeNotifier {
  GetServerTextUseCase? getServerTextUseCase;

  ServerTextController() {
    getServerTextUseCase = GetServerTextUseCase();
  }

  String? _serverText;
  String get serverText => _serverText ?? 'No Data';

  void getServerText() async {
    final serverResultOrError = await getServerTextUseCase?.call(unit);

    if (serverResultOrError != null) {
      serverResultOrError.fold(
        (error) => _serverText = 'Smth wrong with it',
        (data) => _serverText = data,
      );
    }

    notifyListeners();
  }
}
