import 'package:api/api/commondata_api.dart';
import 'package:injectable/injectable.dart';

import '../../common/enums/advertisement_enum.dart';

@lazySingleton
class AdvertisementRepository {
  final CommondataApi _eventDataResAPI;
  AdvertisementRepository(this._eventDataResAPI);

  Future<List<AdsPositionResource>> getBanner(AdvertisementPositionEnum param) async {
    return await _eventDataResAPI.adsGetByPositionIds(param.toString().toLowerCase().split('.').last,'');
  }
}
