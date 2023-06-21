import 'package:core/common/common.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:core/repositories/app/app_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppUseCases {
  final AppRepository _appRepository;
  final BNDLog _log;

  AppUseCases(this._appRepository, this._log);

  Future<Either<String, String>> appGetLink(int objectType, int objectId) async {
    showLoading();
    try {
      final String data = await _appRepository.getLink(objectType, objectId);
      hideLoading();
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      hideLoading();
      return Left(ex.toString());
    }
  }
}
