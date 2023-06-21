import 'package:api/common/model/search/search_model.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_gesture_detector.dart';
import 'package:core/components/html/text_html_widget.dart';
import 'package:flutter/material.dart';
import 'package:learn/features/route/route_goto.dart';
import 'package:vitan_edu/features/route/route_goto.dart';
import 'package:exam/features/route/route_goto.dart' as exam;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VSR4ItemResultWidget extends StatelessWidget {
  final DataSearch dataSearch;

  const VSR4ItemResultWidget({Key? key, required this.dataSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BndGestureDetector(
      onTap: () => _checkGoTo(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              dataSearch.title,
              style: textStyleBodyMedium.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            // if(CommentTypeEnum.values[dataSearch.objectType] != CommentTypeEnum.ExamSet)
            Container(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                constraints: BoxConstraints(
                    // maxHeight: MediaQuery.of(context).size.height * 0.14.h,
                    // minHeight: 10
                    ),
                child: TextHtmlWidget(dataSearch.description.trim(), maxline: 10)),
          ],
        ),
      ),
    );
  }

  void _checkGoTo(BuildContext context) {
    switch (CommentTypeEnum.values[dataSearch.objectType]) {
      case CommentTypeEnum.Exam:
        exam.goToVDE5ExamDetail(context, dataSearch.objectId, isBackToSuperApp: true);
        break;
      case CommentTypeEnum.GroupExam:
        exam.goToVGE3InformationGroup(context, groupId: dataSearch.objectId);
        break;
      case CommentTypeEnum.Event:
        goToVEO5EventDetailScreen(context, dataSearch.objectId);
        break;
      case CommentTypeEnum.Course:
        goToAVL14CourseDetailScreen(context, id: dataSearch.objectId);
        break;
      // return EventItemWidget(context, listEvent, isPadding: false);
      case CommentTypeEnum.Content:
        exam.goToVNNewsDetail(context, dataSearch.objectId);
        break;
      case CommentTypeEnum.Contest:
        goToContest(context, params: dataSearch.data?.dataContest?.url ?? '');
        break;
      case CommentTypeEnum.ContestSubmission:
        goToContest(context, params: dataSearch.data?.dataContestSubmission?.url ?? '');
        break;
      case CommentTypeEnum.ExamSet:
        exam.goToVDE4ListExamInExamSet(context, dataSearch.objectId, -1);
        break;
      case CommentTypeEnum.ExamPackage:
        exam.goToMPP3ExamPackageDetailScreen(context, dataSearch.objectId);
        break;
      default:
        break;
    }
  }
}
