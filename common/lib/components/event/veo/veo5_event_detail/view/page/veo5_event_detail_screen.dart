import 'package:api/api/commondata_api_models.dart';
import 'package:common/components/event/veo/veo5_event_detail/bloc/veo5_event_detail_bloc.dart';
import 'package:common/components/event/veo/veo5_event_detail/bloc/veo5_event_detail_state.dart';
import 'package:common/components/event/veo/veo5_event_detail/bloc/veo5_view_model.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/widgets/veo5_bottom_widget.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/widgets/veo5_description_widget.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/widgets/veo5_info_item_widget.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/widgets/veo5_loading_widget.dart';
import 'package:common/components/event/veo/veo5_event_detail/view/widgets/veo5_top_widget.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/appbar/app_bar_default.dart';
import 'package:core/components/bottom/scroll_to_hide_widget.dart';
import 'package:core/components/bottom_sheet/bnd_bottom_sheet_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:expandable_text/expandable_text.dart';

class VEO5EventDetailScreen extends StatelessWidget {
  final int eventId;

  VEO5EventDetailScreen({Key? key, required this.eventId}) : super(key: key);

  final VEO5EventDetailBloc _bloc = GetIt.I<VEO5EventDetailBloc>();
  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);
  final ScrollController _controller = ScrollController();

  Widget _height(double height) => SizedBox(height: height);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VEO5EventDetailBloc>(
      create: (_) => _bloc..getEventById(eventId),
      child: Scaffold(
        appBar: AppBarDefault(
          context,
          AppLocalizations.of(context)!.translate("event"),
          leading: CommonLeadingWidget(),
          colorAppbar: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
        ),
        body: _veo5BodyWidget(),
        bottomNavigationBar: _buildBottom(context),
      ),
    );
  }

  Widget _veo5BodyWidget() {
    return BlocBuilder<VEO5EventDetailBloc, VEO5EventDetailState>(
      builder: (BuildContext context, VEO5EventDetailState state) {
        if (state is VEO5EventDetailLoading) {
          return const VEO5LoadingWidget();
        } else if (state is VEO5EventDetailLoaded) {
          final VEO5ViewModel viewModel = state.viewModel;
          final EventPublicResource _model = state.viewModel.model;
          return SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: <Widget>[
                VEO5TopWidget(
                  id: eventId,
                  onInvite: () {
                    goToVEO6ListMemberEventScreen(context, eventId);
                  },
                  eventAvatar: _model.avatar,
                  listMember: _model.listEventUser!.data ?? <SimpleUserEntity>[],
                  totalEventUser: _model.totalEventUser,
                  isShowInvited: viewModel.isShowInvite,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 24, top: 20, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_model.title, style: textStyleHeadline4.copyWith(color: CoreColor.textColor)),
                      _height(16),
                      _model.startDate != null || _model.endDate != null
                          ? Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: VEO5InfoItemWidget(
                                  icon: Images.icCalendar3,
                                  title: _model.startDate != null
                                      ? AppLocalizations.of(context)!
                                          .displayDateTime(_model.startDate!, isFullTime: false, isDateOfWeek: true)
                                      : "",
                                  description: _model.endDate != null
                                      ? AppLocalizations.of(context)!.translate("end") +
                                          ": " +
                                          AppLocalizations.of(context)!.displayDateTime(
                                            _model.endDate!,
                                            isFullTime: false,
                                          )
                                      : ""))
                          : const SizedBox(),
                      if (_model.address.isNotEmpty)
                        VEO5InfoItemWidget(
                            icon: Images.icLocation, title: _model.location, description: _model.address),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // VEO5OrganizationWidget(),
                      _height(20),
                      // VEO5DescriptionWidget(title: 'description', content: _model.description),
                      Text(
                        AppLocalizations.of(context)!.translate('description'),
                        style: textStyleBodyMedium.copyWith(
                          color: CoreColor.textColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ExpandableText(
                        _model.description,
                        expandText: AppLocalizations.of(context)!.translate("show_more"),
                        collapseText: AppLocalizations.of(context)!.translate("show_less"),
                        maxLines: 3,
                        style: textStyleBodyDefault,
                        expandOnTextTap: true,
                        collapseOnTextTap: true,
                        animationDuration: const Duration(milliseconds: 1500),
                        animation: true,
                      ),
                      _height(20),
                      VEO5DescriptionWidget(title: 'content', content: _model.content),
                      _height(20)
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is VEO5EventDetailError) {
          return Center(child: BnDNoData());
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildBottom(BuildContext context) {
    return BlocBuilder<VEO5EventDetailBloc, VEO5EventDetailState>(
      builder: (_, state) {
        final VEO5ViewModel viewModel = state.viewModel;
        final EventPublicResource _model = state.viewModel.model;
        if (state is VEO5EventDetailLoaded && viewModel.isShowSignUp) {
          return ScrollToHideWidget(
            height: 60,
            controller: _controller,
            child: VEO5BottomWidget(onSignUp: () async {
              await _bloc.joinEvent(_model.id).then((bool _value) {
                if (_value) {
                  showModalBottomSheet<Widget>(
                      isDismissible: false,
                      barrierColor: CoreColor.barrierColor,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return BndBottomSheetWidget(
                          iconGradientColor: CoreColor.blueGradient,
                          dottedBorderColor: CoreColor.blueDottedBorder,
                          titleName: AppLocalizations.of(context)!.translate("sign_up_success"),
                          description: AppLocalizations.of(context)!.translate("congratulation_you_joined_event") +
                              " ${_model.title}. " +
                              _buildLocation(context, address: _model.address),
                          onClear: () {
                            Navigator.of(context).pop();
                            _bloc.getEventById(_model.id);
                          },
                        );
                      });
                } else {
                  showErrorMessage(AppLocalizations.of(context)!.translate("sign_up_fail"));
                }
              });
            }),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  String _buildLocation(BuildContext context, {String? address}) {
    if (address == null || address == '') {
      return '';
    }

    return AppLocalizations.of(context)!.translate("see_you_at") + " $address";
  }
}
