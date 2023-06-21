import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';
import 'package:core/common/enums/advertisement_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vitan_edu/features/data/repositories/advertisement_repository/advertisement_repository.dart';

@injectable
class AdvertisementUseCases {
  final AdvertisementRepository _bannerRepository;
  AdvertisementUseCases(this._bannerRepository);

  Future<Either<String, List<BannerResource>>> getList(int numberItem, AdvertisementPositionEnum positionEnum) async {
    try {
      final AdvertisementSliderResModel filter = AdvertisementSliderResModel(
        numberItem: numberItem,
        position: positionEnum.index,
      );
      return Right(await _bannerRepository.getBanner(filter));
    } catch (ex) {
      return Left(ex.toString());
    }
  }
}
