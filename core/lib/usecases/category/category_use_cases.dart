// import 'package:api/api/commondata_api.dart';
// import 'package:core/common/log/bnd_log.dart';
// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:learn/features/data/repositories/category/category_repository.dart';

// @injectable
// class CategoryUseCases {
//   final CategoryRepository _categoryRepository;
//   final BNDLog _log;

//   CategoryUseCases(this._categoryRepository, this._log);

//   Future<Either<String, List<BlockCategoryResource>>> getCategoryByParentId(int parentId) async {
//     try {
//       final List<BlockCategoryResource> data = await _categoryRepository.getCategoryByParentId(parentId);
//       return Right<String, List<BlockCategoryResource>>(data);
//     } catch (ex) {
//       _log.logError(ex.toString());
//       return Left<String, List<BlockCategoryResource>>(ex.toString());
//     }
//   }

//   Future<Either<String, BlockCategoryWhitParentResource>> getWithParent(int parentId) async {
//     try {
//       final BlockCategoryWhitParentResource data = await _categoryRepository.getWithParent(parentId);
//       return Right<String, BlockCategoryWhitParentResource>(data);
//     } catch (ex) {
//       _log.logError(ex.toString());
//       return Left<String, BlockCategoryWhitParentResource>(ex.toString());
//     }
//   }
// }
