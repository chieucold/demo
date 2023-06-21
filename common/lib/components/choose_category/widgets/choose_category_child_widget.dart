import 'package:api/api/commondata_api.dart';
import 'package:api/exam/model/exam_index.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ChooseCategoryChildWidget extends StatelessWidget {
  final List<BlockCategoryResource> listCategory;
  final Function nextCategory;
  final int parentIndex;
  final String parentTitle;
  final int? chooseCategoryTypeEnum;

  ChooseCategoryChildWidget({
    Key? key,
    required this.listCategory,
    required this.nextCategory,
    required this.parentIndex,
    required this.parentTitle,
    this.chooseCategoryTypeEnum,
    // required this.type,
    // this.isFromAssignExam = false,
    // this.isFromListExam = false,
    // this.groupId
  }) : super(key: key);

  final GlobalVariableResource globalVariableResource = GetIt.I<GlobalVariableResource>();

  bool _exitChilds = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, int _index) {
          for (final item in listCategory) {
            if (item.isHaveChild) {
              _exitChilds = true;
              break;
            }
          }
          return _buildItemChild(listCategory[_index], context);
        },
        itemCount: listCategory.length);
  }

  Widget _buildItemChild(BlockCategoryResource categoryModel, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: CoreColor.vde2_2BorderColor)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              padding: CoreColor.paddingBodyDefault.copyWith(top: 18, right: 18, bottom: 18),
              decoration: const BoxDecoration(
                  border: Border(
                right: BorderSide(color: Color(0xFFE2E7EF)),
              )),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    categoryModel.title,
                    style: textStyleBodyMedium.copyWith(fontWeight: FontWeight.w400, color: kTextColor),
                  )),
                  InkWell(
                    onTap: () async {
                      // if (widget.type == ChooseCategoryTypeEnum.fromCompetitive && !widget.isFromAssignExam) {
                      //   globalVariableResource.setCompetitionCategory(categoryModel);
                      //   goToVCE2CompetitionListScreen(context);
                      //   // moveToVCE2CompetitionListScreen(context);
                      // } else if (widget.type == ChooseCategoryTypeEnum.fromCreateCompetitive) {
                      //   globalVariableResource.setTempCompetitionCategory(categoryModel);
                      //   Navigator.of(context).popUntil((Route<void> route) {
                      //     return route.settings.name == vce3CreateCompetitionRouteName;
                      //   });
                      // } else if (widget.type == ChooseCategoryTypeEnum.fromListExamCompetition) {
                      //   globalVariableResource.setTempCompetitionCategory(categoryModel);
                      //   Navigator.of(context).popUntil((Route<void> route) {
                      //     return route.settings.name == vce3ListExamWidgetRouteName;
                      //   });
                      // } else if (isFromAssignExam) {
                      //   globalVariableResource.setExamAssignCategory(categoryModel);
                      //   if (isFromListExam) {
                      //     Navigator.of(context).popUntil((Route route) {
                      //       return route.settings.name == gdm1_4ListExamRouteName;
                      //     });
                      //   } else {
                      //     goToGDM4_1ListExamScreen(context, widget.groupId ?? 0);
                      //   }
                      // } else if (widget.type == ChooseCategoryTypeEnum.fromListExamPackage) {
                      //   globalVariableResource.setExamPackageCategory(categoryModel);
                      //   goToMPP1ExamPackageOverviewScreenWhenFilter(context);
                      // }
                      //Navigator.of(context).pop();
                      if (chooseCategoryTypeEnum == ChooseCategoryTypeEnum.fromExamHome.index) {
                        await globalVariableResource
                            .setExamCategory(ParentCategoryModel(index: parentIndex, title: parentTitle));
                        //await globalVariableResource.setScreenIndexCategory(index);
                      }
                      Navigator.of(context).pop(categoryModel);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: CoreColor.buttonAcceptBorderColor),
                        ),
                        child: Text(AppLocalizations.of(context)!.translate("choose_category").toUpperCase(),
                            style: textStyleBodySmallBold)),
                  ),
                ],
              ),
            ),
          ),
          if (_exitChilds)
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: !categoryModel.isHaveChild
                      ? null
                      : () {
                          nextCategory(BlockCategoryObjectResource(
                              id: categoryModel.id, parentId: categoryModel.parentId, title: categoryModel.title));
                        },
                  child: Container(
                    padding: const EdgeInsets.only(top: 22, bottom: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (categoryModel.isHaveChild)
                          Text(categoryModel.childCount.toString(), style: textStyleBodyDefault),
                        categoryModel.childCount != 0
                            ? Icon(
                                Icons.navigate_next,
                                color: CoreColor.iconColor,
                              )
                            : const SizedBox(
                                width: 25,
                              ),
                      ],
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
