import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';
import 'package:core/common/enums/advertisement_enum.dart';
import 'package:core/repositories/advertisement_repository/advertisement_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@injectable
class AdvertisementUseCases {
  final AdvertisementRepository _bannerRepository;
  AdvertisementUseCases(this._bannerRepository);

  Future<Either<String, List<AdsPositionResource>>> getList(AdvertisementPositionEnum positionEnum) async {
    try {

      return Right<String, List<AdsPositionResource>>(await _bannerRepository.getBanner(positionEnum));
    } catch (ex) {
      return Left<String, List<AdsPositionResource>>(ex.toString());
    }
  }
}
