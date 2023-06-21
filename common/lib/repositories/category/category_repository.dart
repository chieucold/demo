import 'package:api/api/commondata_api.dart';

class CategoryRepository {
  final CommondataApi _commonDataResAPI;

  CategoryRepository(this._commonDataResAPI);

  Future<List<BlockCategoryResource>> getCategoryByParentId(int parentId,
      {int objectId = 0, String parentCode = ""}) async {
    final BlockCategoryGetCategoryByParentIdRequest _request =
        BlockCategoryGetCategoryByParentIdRequest(parentId: parentId, systemObjectId: objectId, code: parentCode);
    return _commonDataResAPI.blockCategoryGetCategoryByParentId(_request);
  }

  Future<BlockCategoryWhitParentResource> getWithParent(int parentId) async {
    return _commonDataResAPI.blockCategoryGetWithParent(parentId);
  }
}
