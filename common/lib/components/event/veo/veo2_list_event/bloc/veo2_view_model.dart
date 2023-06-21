import 'package:api/api/commondata_api.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'veo2_view_model.freezed.dart';

@freezed
class VEO2ViewModel with _$VEO2ViewModel {
  factory VEO2ViewModel({
    required List<EventUserResource> register,
    required List<EventPublicResource> upcoming,
    required List<EventUserResource> invitation,
    required List<EventPublicResource> past,
    required List<EventPublicResource> happening,
    required VEO2TabTypeEnum type,
    required int totalRow,
    required EventGetListEventByCurrentUserRequest myEventsRequest,
    required EventPublicFilter getAllEventRequest,
  }) = _VEO2ViewModel;
}
