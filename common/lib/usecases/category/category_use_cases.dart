import 'package:api/api/commondata_api.dart';
import 'package:common/repositories/category/category_repository.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryUseCases {
  final CategoryRepository _categoryRepository;
  final BNDLog _log;

  CategoryUseCases(this._categoryRepository, this._log);

  Future<Either<String, List<BlockCategoryResource>>> getCategoryByParentId(int parentId,
      {int objectId = 0, String parentCode = ""}) async {
    try {
      final List<BlockCategoryResource> data =
          await _categoryRepository.getCategoryByParentId(parentId, objectId: objectId, parentCode: parentCode);
      return Right<String, List<BlockCategoryResource>>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, List<BlockCategoryResource>>(ex.toString());
    }
  }

  Future<Either<String, BlockCategoryWhitParentResource>> getWithParent(int parentId) async {
    try {
      final BlockCategoryWhitParentResource data = await _categoryRepository.getWithParent(parentId);
      return Right<String, BlockCategoryWhitParentResource>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, BlockCategoryWhitParentResource>(ex.toString());
    }
  }
}
