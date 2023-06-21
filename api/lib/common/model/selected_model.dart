import 'package:core/common/constants/const/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'selected_model.g.dart';
@JsonSerializable()
class SelectedModel extends Equatable {
  String title;
  int id;
  SelectedModel({required this.title, required this.id});

  @override
  List<Object> get props => [id];

  factory SelectedModel.fromJson(Map<String, dynamic> json) =>
      _$SelectedModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedModelToJson(this);
}

@JsonSerializable()
class SelectedBoolModel extends Equatable {
  String title;
  bool? id;

  SelectedBoolModel({required this.title, this.id});

  @override
  List<Object?> get props => <Object?>[id];

  factory SelectedBoolModel.fromJson(Map<String, dynamic> json) =>
      _$SelectedBoolModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedBoolModelToJson(this);
}

class CheckBoxSelectedModel {
  bool isSelected;
  String title;
  CheckBoxSelectedModel(this.isSelected, this.title);
}

class DISCSelectedModel {
  DISCEnum isSelected;
  String title;

  DISCSelectedModel({this.isSelected=DISCEnum.other, this.title=''});
}
