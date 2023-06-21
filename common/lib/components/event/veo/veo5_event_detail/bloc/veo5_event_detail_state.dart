import 'package:api/api/commondata_api_models.dart';
import 'package:common/components/event/veo/veo5_event_detail/bloc/veo5_view_model.dart';

abstract class VEO5EventDetailState {
  final VEO5ViewModel viewModel;

  VEO5EventDetailState(this.viewModel);
}

class VEO5EventDetailInitial extends VEO5EventDetailState {
  VEO5EventDetailInitial()
      : super(VEO5ViewModel(model: EventPublicResource(), isShowInvite: false, isFollow: false, isShowSignUp: false));
}

class VEO5EventDetailLoading extends VEO5EventDetailState {
  VEO5EventDetailLoading()
      : super(VEO5ViewModel(model: EventPublicResource(), isShowInvite: false, isFollow: false, isShowSignUp: false));
}

class VEO5EventDetailLoaded extends VEO5EventDetailState {

  VEO5EventDetailLoaded( VEO5ViewModel viewModel) : super(viewModel);
}

class VEO5EventDetailError extends VEO5EventDetailState {
  final String error;

  VEO5EventDetailError(this.error, VEO5ViewModel viewModel) : super(viewModel);
}
