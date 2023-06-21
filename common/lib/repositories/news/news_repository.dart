import 'package:api/api/commondata_api.dart';
import 'package:api/api/commondata_api_models.dart';

class NewsRepository {
  final CommondataApi _commonDataResAPI;
  NewsRepository(this._commonDataResAPI);

  Future<ContentListResourceFilterResult> getNewsList(ContentBasicFilterResource param) async {
    final ContentListResourceFilterResult data = await _commonDataResAPI.contentGetListNews(param);
    return data;
  }

  Future<ContentResourceFilterResult> getNewsListRelative(ContentRelationFilterResource param) async {
    final ContentResourceFilterResult data = await _commonDataResAPI.contentGetListRelation(param);
    return data;
  }

  Future<ContentResource> getNewsDetail(int id, String? path) async {
    final ContentResource data =
        await _commonDataResAPI.contentGetById(ContentGetByIdRequest(id: id, isTracking: true, path: path ?? ''));
    return data;
  }

  Future<ContentListPublicResource> contentGetListBasic(ContentBasicFilterResource param) async {
    final ContentListPublicResource data = await _commonDataResAPI.contentGetListBasic(param);
    return data;
  }
}
