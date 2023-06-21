import 'package:api/api/guide_api.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_multi_choice_by_code_model.g.dart';

@JsonSerializable()
class ResultMultiChoiceByCodeModel {
  ResultMultiChoiceByCodeModel({
    this.finishTestMI,
    this.finishTestMBTI,
    this.finishTestYGPI,
    this.finishTestIQ,
  });

  // factory ResultMultiChoiceByCodeModel.fromJson(Map<String, dynamic> json) =>
  //     _$ResultMultiChoiceByCodeModelFromJson(json);

  factory ResultMultiChoiceByCodeModel.fromJson(Map<String, dynamic> json) {
    return ResultMultiChoiceByCodeModel(
      finishTestMBTI: PersonalityGroupEntity.fromJson(json),
      finishTestYGPI: TestYGPIResultPreviewOutputResource.fromJson(json),
      finishTestIQ: TestIQResultOutputResource.fromJson(json),
      finishTestMI: json is List<dynamic>?
          ? (json as List<dynamic>?)
                  ?.map((e) => PersonalityGroupPointResource.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              []
          : null,
    );
  }

  @JsonKey()
  List<PersonalityGroupPointResource>? finishTestMI;
  @JsonKey()
  PersonalityGroupEntity? finishTestMBTI;
  @JsonKey()
  TestYGPIResultPreviewOutputResource? finishTestYGPI;
  @JsonKey()
  TestIQResultOutputResource? finishTestIQ;
}
