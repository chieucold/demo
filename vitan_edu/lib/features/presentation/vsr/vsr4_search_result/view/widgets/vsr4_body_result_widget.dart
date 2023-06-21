import 'package:api/api/exam_api_models.dart';
import 'package:api/common/model/common_index.dart';
import 'package:common/components/event/veo/event_item_widget.dart';
import 'package:common/components/event/widget/event_content_item_widget.dart';
import 'package:common/components/news/common/news_format_date.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/custom_listview.dart';
import 'package:core/components/shimmer/shimmer_list_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:exam/core/common/injection.dart';
import 'package:exam/core/widget/exam_widget/exam_item_widget.dart';
import 'package:exam/core/widget/exam_widget/exam_set_item_widget.dart';
import 'package:exam/features/presentation/vde/vde1_exam_examset/bloc/vde1_exam_set_bloc.dart';
import 'package:exam/features/presentation/vde/vde1_exam_examset/bloc/vde1_exam_set_state.dart';
import 'package:exam/features/presentation/vge/vge1_list_group/view/widget/vge1_item_group_all.dart';
import 'package:exam/features/route/route_goto.dart' as exam;
import 'package:flutter/material.dart';
import 'package:api/api/commondata_api_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/bloc/vsr4_search_result_bloc.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/bloc/vsr4_search_result_state.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/bloc/vsr4_tab_bloc.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/view/widgets/vsr4_item_result_widget.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class VSR4BodyResultWidget extends StatefulWidget {
  VSR4BodyResultWidget({Key? key, required this.onChangeTab, required this.blockModel}) : super(key: key);
  final Function(int pageIndex) onChangeTab;
  final BlockModel blockModel;

  @override
  State<VSR4BodyResultWidget> createState() => _VSR4BodyResultWidgetState();
}

class _VSR4BodyResultWidgetState extends State<VSR4BodyResultWidget> with AutomaticKeepAliveClientMixin {
  final VDE1ExamSetBloc _examSetBloc = getIt();
  final VSR4SearchResultBloc _bloc = getItSuper();
  late VSR4TabBloc _vsr4tabBloc;

  @override
  void initState() {
    super.initState();
    _vsr4tabBloc = BlocProvider.of<VSR4TabBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // return BlocBuilder<VSR4TabBloc, VSR4TabState>(
    //     bloc: _vsr4tabBloc,
    //     builder: (context, stateTab) {
    return BlocProvider<VSR4SearchResultBloc>(
      create: (context) =>
          _bloc..init(_vsr4tabBloc.categorySelected.objectType, _vsr4tabBloc.blockId, _vsr4tabBloc.keySearch),
      child: BlocBuilder<VSR4SearchResultBloc, VSR4SearchResultState>(
        builder: (context, state) {
          if (state is VSR4SearchResultLoading) {
            return ShimmerListWidget();
          }
          if (state is VSR4SearchResultError) return BnDNoData();
          final List<DataSearch> _listData = state.searchFilterResultModel.data;
          final List<GroupByObjectType> _listDataAll = state.searchFilterResultModel.groupByObjectType;
          if (_vsr4tabBloc.categorySelected.objectType == 0) {
            return _listAll(_listDataAll);
          }
          return CustomListView<DataSearch>(
              padding: CustomTheme.paddingBodyDefault,
              backgroundPullRefresh: widget.blockModel.backgroundColor,
              shrinkWrap: true,
              itemBuilder: (context, index) => VSR4ItemResultWidget(dataSearch: _listData[index]),
              separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                  ),
              onRefresh: () => _bloc.refresh(_vsr4tabBloc.blockId),
              onLoading: _bloc.loadMore,
              items: _listData,
              totalItem: _vsr4tabBloc.categorySelected.total);
        },
      ),
    );
    // });
  }

  Widget _listAll(List<GroupByObjectType> data) {
    final int _totalType = data.length;
    return CustomListView<GroupByObjectType>(
        backgroundPullRefresh: widget.blockModel.backgroundColor,
        shrinkWrap: true,
        itemBuilder: (context, index) => _buildItemSearchAll(context, data[index], data[index].total),
        separatorBuilder: (context, index) => Divider(
              thickness: 6,
              color: CustomTheme.dividerSecondColor,
            ),
        onRefresh: () => _bloc.refresh(_vsr4tabBloc.blockId),
        items: data,
        totalItem: _totalType);
  }

  Widget _otherList(List<DataSearch> data) {
    return CustomListView<DataSearch>(
        backgroundPullRefresh: widget.blockModel.backgroundColor,
        itemBuilder: (context, index) => Padding(
              padding: CustomTheme.paddingBodyDefault.copyWith(top: 24, bottom: 24),
              child: _buildItem(context, CommentTypeEnum.values[data.first.objectType], index, data[index]),
            ),
        totalItem: _vsr4tabBloc.categorySelected.total,
        separatorBuilder: (context, index) => Divider(
              thickness: 6,
            ),
        onRefresh: () => _bloc.refresh(_vsr4tabBloc.blockId),
        onLoading: _bloc.loadMore,
        items: data);
  }

  Widget _buildItemSearchAll(BuildContext context, GroupByObjectType data, int totalRows) {
    final int type = data.objectType;
    final bool isMaxLength = data.data.length > 1;
    return Container(
      padding: CustomTheme.paddingBodyDefault.copyWith(top: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_getTitle(context, CommentTypeEnum.values[type]), style: textStyleHeadline6.copyWith(color: kTextColor)),
          const SizedBox(height: 12),
          if (data.data.isNotEmpty)
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => VSR4ItemResultWidget(dataSearch: data.data[index]),
                // _buildItem(context, CommentTypeEnum.values[type], index, data.data[index]),
                separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                    ),
                itemCount: isMaxLength ? 2 : 1),
          if (totalRows > 1)
            BndGestureDetector(
              onTap: () {
                final int? index = _vsr4tabBloc.listCategory.firstWhere((element) => element.objectType == type).index;
                if (index != null) {
                  widget.onChangeTab(index);
                  _vsr4tabBloc.changeFilter(GroupByObjectType(objectType: data.objectType));
                }
              },
              child: Align(
                  alignment: Alignment.center,
                  child: Text(AppLocalizations.of(context)!.translate('show_all') + ' ' + '(${totalRows})',
                      style: textStyleBodySmall)),
            ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, CommentTypeEnum type, int index, DataSearch data) {
    switch (type) {
      case CommentTypeEnum.Exam:
        final DataExamSearch dataResultModel = data.data?.dataExamSearch ?? DataExamSearch();
        final ExamBaseResource examModel = ExamBaseResource(
            id: data.objectId,
            title: data.title,
            status: data.data?.dataExamSearch?.status ?? 0,
            members: [],
            duration: dataResultModel.duration,
            examCategoryId: dataResultModel.examCategoryId,
            type: dataResultModel.type,
            examLevel: dataResultModel.examLevel,
            examTimeTo: dataResultModel.examTimeTo,
            examTimeFrom: dataResultModel.examTimeFrom);
        return ExamItemWidget(
          isPadding: false,
          model: examModel,
          onTap: () {
            exam.goToVDE5ExamDetail(context, data.objectId);
          },
          likedIds: [1],
        );
      case CommentTypeEnum.GroupExam:
        final MyGroupResource groupModel = MyGroupResource(id: data.objectId, name: data.title);
        return VGE1ItemGroupAll(data: groupModel);
      case CommentTypeEnum.Event:
        final listEvent = EventPublicResource(
            id: data.objectId,
            status: data.data?.dataEventSearch?.status ?? 0,
            title: data.title,
            totalEventUser: data.data?.dataEventSearch?.totalEventUser ?? 0,
            avatar: data.data?.dataEventSearch?.avatar ?? '',
            isHot: data.data?.dataEventSearch?.isHot ?? false);
        return EventItemWidget(
          id: listEvent.id,
          content: EventContentItemWidget(context, listEvent),
          imageUrl: listEvent.avatar,
          onTap: () => goToVEO5EventDetailScreen(context, listEvent.id),
          padding: EdgeInsets.only(bottom: 16),
        );
      // return EventItemWidget(context, listEvent, isPadding: false);
      case CommentTypeEnum.Content:
        return _buildContentWidget(data.data?.dataContent ?? DataContentSearch());
      case CommentTypeEnum.Contest:
        return _buildContentWidget(data.data?.dataContest ?? DataContentSearch(), isContest: true);
      case CommentTypeEnum.ContestSubmission:
        return _buildContentWidget(data.data?.dataContestSubmission ?? DataContentSearch(), isContest: true);

      case CommentTypeEnum.ExamSet:
        final _model = ExamSetPublicResource(title: data.title, id: data.objectId);
        return BlocBuilder<VDE1ExamSetBloc, VDE1ExamSetState>(
          bloc: _examSetBloc,
          builder: (context, state) {
            final List<int> likeId = state.viewModel.likedId;
            return ExamSetItemWidget(
              examSetModel: _model,
              onTap: () {
                //toDo
                exam.goToVDE4ListExamInExamSet(context, _model.id, -1);
              },
              isShowLikeReaction: true,
              likedIds: likeId,
              onReactionExam: () async {
                //toDo
                _examSetBloc.examSetReactionExamSet(_model.id, context);
                setState(() {});
              },
            );
          },
        );
      default:
        return const SizedBox();
    }
  }

  String _getTitle(BuildContext context, CommentTypeEnum type) {
    switch (type) {
      case CommentTypeEnum.Exam:
        return AppLocalizations.of(context)!.translate('list_exam');
      case CommentTypeEnum.GroupExam:
        return AppLocalizations.of(context)!.translate('group');
      case CommentTypeEnum.Event:
        return AppLocalizations.of(context)!.translate('exam_offline_event');
      case CommentTypeEnum.Content:
        return AppLocalizations.of(context)!.translate('news_title');
      case CommentTypeEnum.ExamSet:
        return AppLocalizations.of(context)!.translate('exam_set');
      case CommentTypeEnum.Contest:
        return AppLocalizations.of(context)!.translate('Contest');
      case CommentTypeEnum.ContestSubmission:
        return AppLocalizations.of(context)!.translate('contest_submission');
      default:
        return '';
    }
  }

  Widget _buildContentWidget(DataContentSearch dataContentSearch, {bool isContest = false}) {
    final DateTime _date = dataContentSearch.publishedDate ?? DateTime.now();
    return EventItemWidget(
      id: dataContentSearch.id,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dataContentSearch.title,
            style: textStyleBodyDefault.copyWith(fontWeight: FontWeight.w700, fontSize: 18, color: kTextColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              dataContentSearch.publishedDate != null
                  ? formatDatetimetoString(_date, context, style: 2) + AppLocalizations.of(context)!.displayTime(_date)
                  : '',
              style: textStyleBodySmall.copyWith(color: CustomTheme.vnDateNewsColor.withOpacity(0.5)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      imageUrl: dataContentSearch.avatar,
      onTap: () => isContest
          ? goToContest(context, params: dataContentSearch.url)
          : exam.goToVNNewsDetail(context, dataContentSearch.id),
      padding: EdgeInsets.only(bottom: 16),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
