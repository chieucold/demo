import 'package:api/api/commondata_api_models.dart';
import 'package:api/system/model/system_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'veo6_view_model.freezed.dart';

@freezed
class VEO6ViewModel with _$VEO6ViewModel {
  factory VEO6ViewModel({
    required List<EventListUserInvitedResource> listMember,
    required List<int> userIds,
    required int totalMember
  })= _VEO6ViewModel;
}