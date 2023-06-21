import 'package:api/api/commondata_api.dart';
import 'package:common/components/choose_category/bloc/choose_category_bloc.dart';
import 'package:common/components/choose_category/bloc/choose_category_state.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/components/appbar/app_bar_default.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// ignore: must_be_immutable
class ChooseCategory extends StatelessWidget {
  ChooseCategory({
    Key? key,
    // required this.chooseCategoryTypeEnum,
    this.floatingButton,
    this.currentId = 0,
    this.parentId = 0,
    this.title = '',
  }) : super(key: key);
  // final int chooseCategoryTypeEnum;
  final int currentId;
  final int parentId;
  final String title;

  final Widget? floatingButton;
  final ChooseCategoryBloc _categoryBloc = GetIt.I<ChooseCategoryBloc>();

  //final GlobalVariableResource globalVariableResource = getIt<GlobalVariableResource>();
  // int? _currentParentId;
  // String? _parentTitle;
  // int? _screenIndex;
  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        context,
        AppLocalizations.of(context)!.translate("category"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        colorAppbar: listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor,
      ),
      body: _buildBody(),
      floatingActionButton: floatingButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  Widget _buildBody() {
    //setValueParent();
    return BlocProvider<ChooseCategoryBloc>(
      create: (BuildContext context) => _categoryBloc
        ..setWidget(BlockCategoryObjectResource(id: parentId, title: title, parentId: 0), categoryId: currentId),
      child: BlocBuilder<ChooseCategoryBloc, ChooseCategoryState>(
        builder: (BuildContext context, ChooseCategoryState state) {
          if (state is ChooseCategoryLoaded) {
            return state.widgets[state.parentId] ?? const SizedBox();
          }
          return const SizedBox();
        },
      ),
    );
  }

  // void setValueParent() {
  //   if (chooseCategoryTypeEnum == ChooseCategoryTypeEnum.fromExamHome.index) {
  //     final List<ParentCategoryModel> listParentData = globalVariableResource.getParentExamCategories();
  //     if (listParentData.length > 0) {
  //       final ParentCategoryModel _value = globalVariableResource.getExamCategory();
  //       _currentParentId = _value.index;
  //       _parentTitle = _value.title;
  //       _screenIndex = globalVariableResource.getScreenIndexCategory() ?? 0;
  //     }
  //   }
  // }
}
