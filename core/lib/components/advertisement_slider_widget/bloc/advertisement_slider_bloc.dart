import 'dart:async';
import 'package:api/api/commondata_api.dart';
import 'package:core/common/bloc/base_cubit.dart';
import 'package:core/common/bloc/base_state.dart';
import 'package:core/common/common.dart';
import 'package:core/common/enums/advertisement_enum.dart';
import 'package:core/components/advertisement_slider_widget/bloc/advertisement_slider_child_widget.dart';
import 'package:core/usecases/advertisement/advertisement_cases.dart';
import 'package:dartz/dartz.dart';

class AdvertisementSliderBloc extends BaseCubit<BaseStateBloc<String>> {
  final AdvertisementUseCases _advertismentUseCases;

  AdvertisementSliderBloc(this._advertismentUseCases) : super(InitState<String>(''));

  List<String> _listUrl = [];

  List<String> get listUrl => _listUrl;


  String url = '';

  late double _height;

  double get sizeHeight => _height;



  Future<void> getListBanner(
      {AdvertisementPositionEnum position = AdvertisementPositionEnum.Empty, int numberItem = 2}) async {
    emit(LoadingState<String>(state.model));
    final Either<String, List<AdsPositionResource>> data = await _advertismentUseCases.getList(position);
    data.fold((String failure) => emit(ErrorState<String>(failure)), (List<AdsPositionResource> data) {
      if (data.isNotEmpty && data.first.ads!.isNotEmpty) {
        _listUrl = (data.first.ads ?? <AdsPublicResource>[]).map((AdsPublicResource e) => e.url).toList();
        url = _listUrl.first;
        _height = toDouble(data.first.height);
        emit(LoadedState<String>(_listUrl.first));
      }else{
        emit(ErrorState<String>(''));
      }
    });
  }

}
