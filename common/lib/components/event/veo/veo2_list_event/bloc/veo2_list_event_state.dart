import 'package:api/api/commondata_api.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_view_model.dart';
import 'package:core/common/common.dart';
import 'package:equatable/equatable.dart';

abstract class VEO2ListEventState extends Equatable {
  final VEO2ViewModel viewModel;

  VEO2ListEventState({required this.viewModel});
  @override
  List<Object?> get props => <VEO2ViewModel>[];
}

class VEO2ListEventInitial extends VEO2ListEventState {
  VEO2ListEventInitial()
      : super(
            viewModel: VEO2ViewModel(
          register: <EventUserResource>[],
          upcoming: <EventPublicResource>[],
          invitation: <EventUserResource>[],
          happening: <EventPublicResource>[],
          past: <EventPublicResource>[],
          type: VEO2TabTypeEnum.join,
          totalRow: 0,
          myEventsRequest: EventGetListEventByCurrentUserRequest(
            pageIndex: 1,
            pageSize: 10,
          ),
          getAllEventRequest: EventPublicFilter(pageIndex: 1, pageSize: 10, type: 0), //type = 2 -offline, 1 online
        ));
}

class VEO2ListEventLoading extends VEO2ListEventState {
  VEO2ListEventLoading(VEO2ViewModel viewModel) : super(viewModel: viewModel);
}

class VEO2ListEventLoaded extends VEO2ListEventState {
  VEO2ListEventLoaded(VEO2ViewModel viewModel) : super(viewModel: viewModel);
}

class VEO2TabCountLoaded extends VEO2ListEventState {
  VEO2TabCountLoaded(VEO2ViewModel viewModel) : super(viewModel: viewModel);
}

class VEO2ListEventError extends VEO2ListEventState {
  final String error;
  VEO2ListEventError(this.error, VEO2ViewModel viewModel) : super(viewModel: viewModel);
}
