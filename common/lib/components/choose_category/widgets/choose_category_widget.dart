import 'package:api/api/commondata_api.dart';
import 'package:common/components/choose_category/bloc/choose_category_item_bloc.dart';
import 'package:common/components/choose_category/widgets/choose_category_child_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/enums/advertisement_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/advertisement_slider_widget/advertisement_slider_widget.dart';
import 'package:core/components/bnd_listview.dart';
import 'package:core/components/header_with_back_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/choose_category_item_state.dart';

class ChooseCategoryWidget extends StatelessWidget {
  ChooseCategoryWidget({
    Key? key,
    this.category, // Cái này có thể truyền qua
    required this.nextCategory,
    // this.chooseCategoryTypeEnum,
    required this.previousCategory,
    this.currentId = 0,
  }) : super(key: key);
  final BlockCategoryObjectResource? category;
  final ChooseCategoryItemBloc _categoryBloc = GetIt.I();
  final Function nextCategory;
  final Function previousCategory;
  // final int? chooseCategoryTypeEnum;
  final int currentId; // Id của danh mục hiện tại trong trường hợp chọn lại

  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseCategoryItemBloc>(
      create: (BuildContext context) => _categoryBloc..getListCategory(currentId: currentId, category: category),
      child: BlocBuilder<ChooseCategoryItemBloc, ChooseCategoryItemState>(
        builder: (_, ChooseCategoryItemState state) {
          final int parentId = state.category.parentId;
          final bool _isBackChooseCategory = GetIt.I<GlobalVariableResource>().getIsBackChooseCategory() ?? true;
          return (parentId == 0 && _isBackChooseCategory)
              ? _buildLevel1(context)
              : _buildOtherLevel(isShowBack: parentId != 0);
        },
      ),
    );
  }

  Widget _buildLevel1(BuildContext context) {
    return BlocBuilder<ChooseCategoryItemBloc, ChooseCategoryItemState>(
      builder: (BuildContext context, ChooseCategoryItemState state) {
        if (state is ChooseCategoryItemLoaded) {
          final List<BlockCategoryResource> items = state.listCategory;
          return Container(
              child: Column(children: <Widget>[
            // if (chooseCategoryTypeEnum != ChooseCategoryTypeEnum.fromCompetitive)
            //   HeaderWidthBackWidget(
            //     context,
            //     (isFromListExam || isFromAssignExam)
            //         ? AppLocalizations.of(context)!.translate("exam_type")
            //         : AppLocalizations.of(context)!.translate("competition_exam_type"),
            //   ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              child: Text(
                AppLocalizations.of(context)!.translate('choose_category_want'),
                textAlign: TextAlign.center,
                style: textStyleBodyDefault,
              ),
            ),
            Expanded(
              child: _level1Items(items),
            ),
            //isFromAssignExam ? GDM1MyStoreWidget() : const SizedBox(),
          ]));
        }
        return const SizedBox();
      },
    );
  }

  Widget _level1Items(List<BlockCategoryResource> items) {
    return Container(
      child: BnDListView(
        scrollbarEnable: false,
        itemCount: items.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index < items.length) {
            final BlockCategoryResource item = items[index];

            return Container(
              margin: CoreColor.paddingBodyDefault.copyWith(bottom: 16),
              padding: const EdgeInsets.only(bottom: 4, top: 4),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: CoreColor.borderDefault),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: ListTile(
                onTap: () {
                  if (item.childCount > 0)
                    nextCategory(BlockCategoryObjectResource(id: item.id, parentId: item.parentId, title: item.title));
                  else
                    Navigator.of(context).pop(item);
                },
                leading: Container(
                  decoration: BoxDecoration(
                      color: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
                      borderRadius: const BorderRadius.all(Radius.circular(12))),
                  width: 44,
                  height: 44,
                  child: Center(
                    child: Text(
                      item.title[0],
                      style: textStyleBodyLarge.copyWith(
                        color: CoreColor.textWhiteColor,
                        fontFamily: fontGilroy,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                title: Text(item.title, style: textStyleBodyDefaultBold.copyWith(color: kTextColor)),
                trailing: Icon(
                  Icons.navigate_next,
                  color: CoreColor.iconColor,
                ),
              ),
            );
          } else if (index == items.length) {
            return Container(
                // margin: CoreColor.paddingBodyDefault,
                child: AdvertisementSliderWidget(
              countAdvertisement: false,
              numberItem: 1,
              position: AdvertisementPositionEnum.examCategory,
            ));
          } else {
            return const SizedBox(
              height: 80,
            );
          }
        },
      ),
    );
  }

  Widget _buildOtherLevel({bool isShowBack = false}) {
    return BlocBuilder<ChooseCategoryItemBloc, ChooseCategoryItemState>(
        builder: (BuildContext context, ChooseCategoryItemState state) {
      if (state is ChooseCategoryItemLoaded) {
        final BlockCategoryObjectResource category = state.category;
        return Column(
          children: <Widget>[
            HeaderWidthBackWidget(context, category.title, onBack: () {
              previousCategory(
                category.parentId,
                category.id,
              );
            }, isShowBack: isShowBack),
            Expanded(
              child: ChooseCategoryChildWidget(
                listCategory: state.listCategory,
                nextCategory: nextCategory,
                parentIndex: category.id,
                parentTitle: category.title,
                // chooseCategoryTypeEnum: chooseCategoryTypeEnum
              ),
            )
          ],
        );
      }
      return const SizedBox();
    });
  }
}
