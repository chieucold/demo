import 'package:api/api/commondata_api_models.dart';
import 'package:api/common/model/event/event_offline_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'veo5_view_model.freezed.dart';

@freezed
class VEO5ViewModel with _$VEO5ViewModel {
  factory VEO5ViewModel({
    required EventPublicResource model,
   required bool isShowInvite,
    required bool isFollow,
    required bool isShowSignUp,
  }) = _VEO5ViewModel;
}