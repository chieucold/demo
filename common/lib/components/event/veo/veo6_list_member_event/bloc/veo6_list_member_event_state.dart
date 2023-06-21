import 'package:api/api/commondata_api_models.dart';
import 'package:common/components/event/veo/veo6_list_member_event/bloc/veo6_view_model.dart';

abstract class VEO6ListMemberEventState {
  final VEO6ViewModel viewModel;

  VEO6ListMemberEventState(this.viewModel);
}

class VEO6ListMemberEventInitial extends VEO6ListMemberEventState {
  VEO6ListMemberEventInitial() : super(VEO6ViewModel(userIds: <int>[], listMember: <EventListUserInvitedResource>[], totalMember: 0));
}

class VEO6ListMemberEventLoading extends VEO6ListMemberEventState {
  VEO6ListMemberEventLoading() : super(VEO6ViewModel(userIds: <int>[], listMember: <EventListUserInvitedResource>[], totalMember: 0));
}

class VEO6ListMemberEventLoaded extends VEO6ListMemberEventState {
  VEO6ListMemberEventLoaded(VEO6ViewModel viewModel)
      : super(viewModel );
}

class VEO6ListMemberEventError extends VEO6ListMemberEventState {
  final String failure;
  VEO6ListMemberEventError(VEO6ViewModel viewModel, this.failure) : super(viewModel);
}
