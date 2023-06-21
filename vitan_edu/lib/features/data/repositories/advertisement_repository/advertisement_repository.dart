import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';

class AdvertisementRepository {
  final CommondataApi _eventDataResAPI;
  AdvertisementRepository(this._eventDataResAPI);

  Future<List<BannerResource>> getBanner(AdvertisementSliderResModel param) async {
    return await _eventDataResAPI.bannerGetBannerByPosition(param.numberItem ?? 1, param.position ?? 0);
  }
}
