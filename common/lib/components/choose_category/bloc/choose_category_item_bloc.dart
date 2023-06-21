import 'package:api/api/commondata_api.dart';
import 'package:common/usecases/category/category_use_cases.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import 'choose_category_item_state.dart';

class ChooseCategoryItemBloc extends Cubit<ChooseCategoryItemState> {
  final CategoryUseCases _categoryUseCases;
  final GlobalVariableResource _globalVariableResource;

  ChooseCategoryItemBloc(this._categoryUseCases, this._globalVariableResource) : super(ChooseCategoryItemInitial());

  Future<void> getListCategory({
    BlockCategoryObjectResource? category,
    bool isChangeParent = false,
    int currentId = 0,
  }) async {
    category ??= BlockCategoryObjectResource();
    if (!isChangeParent) emit(ChooseCategoryItemLoading());
    List<BlockCategoryResource> data = <BlockCategoryResource>[];
    if (currentId > 0) {
      final Either<String, BlockCategoryWhitParentResource> result = await _categoryUseCases.getWithParent(currentId);
      result.fold((String failure) => emit(ChooseCategoryItemError(contentError: failure)),
          (BlockCategoryWhitParentResource temp) {
        final BlockCategoryObjectResource? parent = temp.parent;
        if (parent != null) {
          // ignore: parameter_assignments
          category = parent;
          data = temp.childs ?? <BlockCategoryResource>[];
        }
      });
    } else {
      final Either<String, List<BlockCategoryResource>> result =
          await _categoryUseCases.getCategoryByParentId(category.id);
      result.fold((String failure) => emit(ChooseCategoryItemError(contentError: failure)),
          (List<BlockCategoryResource> temp) => data = temp);
    }
    emit(ChooseCategoryItemLoaded(listCategory: data, category: category!));
  }

  // Future<bool> setUserCategory(int blockCategoryId) async {
  //   // final Either<String, bool> data = await _categoryOfUserUseCases.saveCategoryOfUser(blockCategoryId);
  //   // if (data.isLeft()) return false;
  //   return true;
  // }

  // Future<void> setCategoryAndNextScreen(BuildContext context) async {
  //   final BlockCategoryResource? item = _globalVariableResource.vhe3CategoryChoose;
  //   if (item == null) return;

  //   if (!item.isHaveChild) {
  //     final bool isSuccess = await setUserCategory(item.id);
  //     if (isSuccess)
  //       popToVHE8HomeExam(context, 0);
  //     else
  //       showErrorMessage(AppLocalizations.of(context)!.translate("please_choose_other_category"));
  //   } else
  //     goToVHE7CategoryLV4(context, item);
  // }

  Future<void> changeParent(int parentId) async {
    await getListCategory(category: BlockCategoryObjectResource(id: parentId), isChangeParent: true);
  }

  Future<void> setChooseCategory(BlockCategoryResource item, {List<BlockCategoryResource>? itemParents}) async {
    _globalVariableResource.vhe3CategoryChoose = item;
    if (itemParents != null)
      _globalVariableResource.vhe7ParentCategories =
          itemParents.where((BlockCategoryResource c) => c.isHaveChild).toList();
  }
}
