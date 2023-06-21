import 'package:api/api/commondata_api.dart';
import 'package:common/repositories/news/news_repository.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@injectable
class NewsUsecases {
  final NewsRepository _newsRepository;
  final BNDLog _log;
  NewsUsecases(this._newsRepository, this._log);

  Future<Either<String, ContentListResourceFilterResult>> getNewsList(ContentBasicFilterResource param) async {
    try {
      final ContentListResourceFilterResult data = await _newsRepository.getNewsList(param);
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }

  Future<Either<String, ContentResourceFilterResult>> getNewsListRelative(ContentRelationFilterResource param) async {
    try {
      final ContentResourceFilterResult data = await _newsRepository.getNewsListRelative(param);
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }

  Future<Either<String, ContentResource>> getNewsDetail(int id, String? path) async {
    try {
      final ContentResource data = await _newsRepository.getNewsDetail(id, path);
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }

  Future<Either<String, ContentListPublicResource>> contentGetListBasic(ContentBasicFilterResource param) async {
    try {
      final ContentListPublicResource data = await _newsRepository.contentGetListBasic(param);
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }
}
