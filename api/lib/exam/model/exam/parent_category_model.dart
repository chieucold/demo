class ParentCategoryModel {
  final int index;
  final String title;

  ParentCategoryModel({required this.index, required this.title, });

  Map<String, dynamic> toJson() => _$ParentCategoryModelToJson(this);

  ParentCategoryModel parentCategoryModelFromJson(Map<String, dynamic> json) {
    return ParentCategoryModel(
        title: json['title'] as String? ?? '', index: json['index'] as int? ?? 0, );
  }

  factory ParentCategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return ParentCategoryModel(
      title: jsonData['title']as String? ?? '',
      index: jsonData['index']as int? ?? 0,
    );
  }

  Map<String, dynamic> _$ParentCategoryModelToJson(ParentCategoryModel instance) => <String, dynamic>{
    'title': instance.title,
    'index': instance.index,

  };
}