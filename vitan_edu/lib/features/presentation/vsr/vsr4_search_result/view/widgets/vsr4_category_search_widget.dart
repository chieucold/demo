import 'package:api/common/model/common_index.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_gesture_detector.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/bloc/vsr4_tab_bloc.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/bloc/vsr4_tab_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VSR4CategorySearchWidget extends StatefulWidget {
  final Function(int pageIndex) onTabChange;
  final AutoScrollController controller;
  final VSR4TabBloc bloc;

  VSR4CategorySearchWidget({Key? key, required this.onTabChange, required this.bloc, required this.controller})
      : super(key: key);

  @override
  State<VSR4CategorySearchWidget> createState() => _VSR4CategorySearchWidgetState();
}

class _VSR4CategorySearchWidgetState extends State<VSR4CategorySearchWidget> {
  late VSR4TabBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc;
    // _bloc.isSetState.stream.listen((isSetState) {
    //   if (isSetState)
    //     setState(() {
    //     });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VSR4TabBloc, VSR4TabState>(
      // bloc: _bloc,
      builder: (context, state) {
        if (state is VSR4TabLoaded)
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 27,
            child: Visibility(
              visible: _bloc.listCategory.length > 1,
              child: ListView.separated(
                  controller: widget.controller,
                  padding: CustomTheme.paddingBodyDefault,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AutoScrollTag(
                      key: ValueKey(index),
                      controller: widget.controller,
                      index: index,
                      child: _buildItemCategory(_bloc.listCategory[index], index)),
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  itemCount: _bloc.listCategory.length),
            ),
          );
        return const SizedBox();
      },
    );
  }

  Widget _buildItemCategory(GroupByObjectType categoryTypeItem, int index) {
    _bloc.listCategory[index].index = index;
    return BndGestureDetector(
      onTap: () async {
        await _bloc.changeFilter(categoryTypeItem);
        widget.onTabChange(index);
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 2.h, 9, 2.h),
        decoration: BoxDecoration(
            gradient: _getGradientColor(categoryTypeItem),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: _getBorderColor(categoryTypeItem))),
        child: Text(
            AppLocalizations.of(context)!.translate(_getTitle(CommentTypeEnum.values[categoryTypeItem.objectType])) +
                ' ' +
                '${categoryTypeItem.total > 0 ? '(${categoryTypeItem.total})' : ''}',
            style: textStyleBodySmall.copyWith(color: _getColorText(categoryTypeItem), fontWeight: FontWeight.w600)),
      ),
    );
  }

  Color _getBorderColor(GroupByObjectType data) {
    if (data.objectType != _bloc.categorySelected.objectType) {
      return CustomTheme.vsr4BorderCategoryColor;
    } else {
      return Colors.transparent;
    }
  }

  Gradient _getGradientColor(GroupByObjectType data) {
    if (data.objectType == _bloc.categorySelected.objectType) {
      return listBlockWithVitan.firstWhere((BlockModel e) => e.id == widget.bloc.blockId).gradient;
    } else {
      return LinearGradient(colors: [Colors.transparent, Colors.transparent]);
    }
  }

  Color _getColorText(GroupByObjectType data) {
    if (data.objectType == _bloc.categorySelected.objectType) {
      return CustomTheme.textWhiteColor;
    } else {
      return CustomTheme.textColor;
    }
  }

  String _getTitle(CommentTypeEnum commentTypeEnum) {
    switch (commentTypeEnum) {
      case CommentTypeEnum.Contest:
        return 'Contest';
      case CommentTypeEnum.Exam:
        return 'exam_title_uppercase';
      case CommentTypeEnum.GroupExam:
        return 'group';
      case CommentTypeEnum.Content:
        return 'news_title';
      case CommentTypeEnum.Event:
        return 'event';
      case CommentTypeEnum.Course:
        return 'course';
      case CommentTypeEnum.ExamSet:
        return 'exam_set';
      case CommentTypeEnum.ContestSubmission:
        return 'contest_submission';
      case CommentTypeEnum.ExamPackage:
        return 'exam_package';
      default:
        return 'all';
    }
  }
}
