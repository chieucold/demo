import 'dart:convert';
import 'package:api/api/exam_api_models.dart';
import 'package:api/api/learn_api_models.dart';
import 'package:api/exam/model/exam_index.dart';
import 'package:api/api/commondata_api.dart';
import 'package:core/common/common.dart';
import 'package:core/model/guide_category_object.dart';
import 'package:core/model/list_partnerId_model.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';

class GlobalVariableResource {
  static final GlobalVariableResource _globalVariableResource = GlobalVariableResource._internal();

  factory GlobalVariableResource() {
    return _globalVariableResource;
  }

  bool isBackChooseCategory = true;

  GlobalVariableResource._internal();

  List<ExamFilterLevel> examFilterSelectedIdKey = <ExamFilterLevel>[];

  // List<int> examFilterExpandedIdKey = <int>[];

  // void resetFilterExam() {
  //   examFilterSelectedIdKey = <ExamFilterLevel>[];
  //   examFilterExpandedIdKey = <int>[];
  // }

  ListPartnerIdModel? courseFilter;

  BlockCategoryResource? vhe3CategoryChoose;

  List<BlockCategoryResource> vhe7ParentCategories = <BlockCategoryResource>[];

  GroupExamResource groupExamUserModel = GroupExamResource();

  MyGroupResource groupResource = MyGroupResource(); // Khi vào 1 màn group detail thì lưu vào

  bool isReloadCourseDetail = false;

  bool isOpenFile = false;

  bool isLogout = false;

  ListPartnerIdModel getCourseFilterPropertyResource() {
    return courseFilter ?? ListPartnerIdModel();
  }

  Future<bool> setCourseFilterPropertyResource(ListPartnerIdModel model) async {
    courseFilter = model;
    return true;
  }

  BlockCategoryResource getCompetitionCategory({String key = SharedPreferenceKey.competitionCategoryKey}) {
    final Map<String, dynamic>? temp = LocalStoreManager.getObject(key);
    if (temp != null) return BlockCategoryResource.fromJson(temp);
    return BlockCategoryResource(title: '', id: 0, parentId: 0);
  }

  Future<bool> setCompetitionCategory(BlockCategoryResource model) async {
    await LocalStoreManager.setObject(SharedPreferenceKey.competitionCategoryKey, model.toJson());
    return true;
  }

  Future<bool> setOpenFile(bool isOpen) async {
    isOpenFile = isOpen;
    return true;
  }

  // Sử dụng lúc tạo vòng thi đấu
  bool setTempCompetitionCategory(BlockCategoryResource model) {
    LocalStoreManager.setObject(SharedPreferenceKey.competitionTempCategoryKey, model.toJson());
    return true;
  }

  bool setCheckAnswer(bool isCheckAnswer) {
    LocalStoreManager.setBool(SharedPreferenceKey.isCheckAnswer, isCheckAnswer);
    return true;
  }

  bool getCheckAnswer() {
    return LocalStoreManager.getBool(SharedPreferenceKey.isCheckAnswer);
  }

  bool setExamAssignCategory(BlockCategoryResource categoryModel) {
    LocalStoreManager.setObject(SharedPreferenceKey.assignExamCategoryKey, categoryModel.toJson());
    return true;
  }

  bool setExamPackageCategory(BlockCategoryResource model) {
    LocalStoreManager.setObject(SharedPreferenceKey.examPackageFilterSelectedIdKey, model.toJson());
    return true;
  }

  void clearExamPackageCategory() {
    LocalStoreManager.remove(SharedPreferenceKey.examPackageFilterSelectedIdKey);
  }

  Future<bool> setExamCategory(ParentCategoryModel model) async {
    await LocalStoreManager.setObject(SharedPreferenceKey.examCategorySelected, model.toJson());
    return true;
  }

  ParentCategoryModel getExamCategory({String key = SharedPreferenceKey.examCategorySelected}) {
    final Map<String, dynamic>? temp = LocalStoreManager.getObject(key);
    if (temp != null) return ParentCategoryModel.fromJson(temp);
    return ParentCategoryModel(title: '', index: 0);
  }

  Future<bool> setScreenIndexCategory(int screenIndex) async {
    await LocalStoreManager.setInt(SharedPreferenceKey.screenIndexOfCategoryKey, screenIndex);
    return true;
  }

  int? getScreenIndexCategory({String key = SharedPreferenceKey.screenIndexOfCategoryKey}) {
    final int? temp = LocalStoreManager.getInt(key);
    if (temp != null) return temp;
  }

  Future<bool> setParentExamCategories(List<ParentCategoryModel> models) async {
    await LocalStoreManager.setString(SharedPreferenceKey.parentExamCategoryKey,
        json.encode(models.map((ParentCategoryModel e) => e.toJson()).toList()));
    return true;
  }

  List<ParentCategoryModel> getParentExamCategories({String key = SharedPreferenceKey.parentExamCategoryKey}) {
    final String _result = LocalStoreManager.getString(key);
    List<ParentCategoryModel> temp = <ParentCategoryModel>[];
    if (_result.isNotEmpty) {
      temp = (json.decode(LocalStoreManager.getString(key)) as List<dynamic>).map<ParentCategoryModel>((dynamic item) {
        return ParentCategoryModel.fromJson(item);
      }).toList();
    }
    return temp;
  }

  Future<void> setObjectId(int objectId) async {
    await LocalStoreManager.setInt(SharedPreferenceKey.objectIdKey, objectId);
  }

  Future<int?> getObjectId({String key = SharedPreferenceKey.objectIdKey}) async {
    final int? temp = LocalStoreManager.getInt(key);
    return temp;
  }

  Future<void> setGuideCategoryAndObject(GuideCategoryObjectModel model) async {
    await LocalStoreManager.setObject(SharedPreferenceKey.guideCategoryObjectKey, model.toJson());
  }

  Future<void> resetGuideCategoryAndObject() async {
    final GuideCategoryObjectModel? temp = getGuideCategoryObject();
    if (temp == null || temp.isChooseAll) return;
    if (temp.isCategory) {
      // Vai trò
      temp.objectId = 0;
      temp.objectTitle = "";
    } else {
      // Nhu cầu
      temp.categoryId = 0;
      temp.categoryTitle = "";
    }
    await setGuideCategoryAndObject(temp);
  }

  Future<void> deleteGuideCategoryAndObject() async {
    await LocalStoreManager.remove(SharedPreferenceKey.guideCategoryObjectKey);
  }

  GuideCategoryObjectModel? getGuideCategoryObject() {
    final Map<String, dynamic>? temp = LocalStoreManager.getObject(SharedPreferenceKey.guideCategoryObjectKey);
    if (temp == null) return null;
    return GuideCategoryObjectModel.fromJson(temp);
  }

  Future<void> setIsBackChooseCategory({required bool isBackChooseCategory}) async {
    await LocalStoreManager.setBool(SharedPreferenceKey.isBackChooseCategory, isBackChooseCategory);
  }

  bool? getIsBackChooseCategory({String key = SharedPreferenceKey.isBackChooseCategory}) {
    final bool? isBackChooseCategory = LocalStoreManager.getBool(key);
    return isBackChooseCategory;
  }
}
