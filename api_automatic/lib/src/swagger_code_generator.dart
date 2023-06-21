import 'dart:convert';

import 'package:code_builder/code_builder.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_converter_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';

class SwaggerCodeGenerator {
  final Map<int, SwaggerEnumsGenerator> _enumsMap = <int, SwaggerEnumsGenerator>{
    2: SwaggerEnumsGeneratorV2(),
    3: SwaggerEnumsGeneratorV3()
  };

  final Map<int, SwaggerModelsGenerator> _modelsMap = <int, SwaggerModelsGenerator>{
    2: SwaggerModelsGeneratorV2(),
    3: SwaggerModelsGeneratorV3()
  };

  int _getApiVersion(String dartCode) {
    final dynamic map = jsonDecode(dartCode);

    final openApi = map['openapi'] as String?;
    return openApi != null ? 3 : 2;
  }

  String generateIndexes(String dartCode, Map<String, List<String>> buildExtensions, GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator(dartCode, options).generateIndexes(buildExtensions);

  String generateConverterMappings(
          String dartCode, Map<String, List<String>> buildExtensions, bool hasModels, GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator(dartCode, options).generateConverterMappings(buildExtensions, hasModels, options);

  String generateImportsContent(
    String dartCode,
    String swaggerFileName,
    bool hasModels,
    bool buildOnlyModels,
    bool hasEnums,
    bool separateModels,
    GeneratorOptions options,
  ) =>
      _getSwaggerAdditionsGenerator(dartCode, options).generateImportsContent(
          swaggerFileName, hasModels, buildOnlyModels, hasEnums, separateModels, options.customModelPath);

  String generateConverter(String dartCode, String fileName, GeneratorOptions options) =>
      _getSwaggerConverterGenerator(dartCode).generate(dartCode, fileName, options);

  String generateResponses(String dartCode, String fileName, GeneratorOptions options) =>
      _getSwaggerModelsGenerator(dartCode).generateResponses(dartCode, fileName, options);

  String generateRequestBodies(String dartCode, String fileName, GeneratorOptions options) =>
      _getSwaggerModelsGenerator(dartCode).generateRequestBodies(dartCode, fileName, options);

  String generateEnums(String dartCode, String fileName) =>
      _getSwaggerEnumsGenerator(dartCode).generate(dartCode, fileName);

  String generateModels(
          String dartCode, String fileName, GeneratorOptions options, Map<String, dynamic> requestClass) =>
      _getSwaggerModelsGenerator(dartCode).generate(dartCode, fileName, options, requestClass);

  String generateRequests(String dartCode, String className, String fileName, GeneratorOptions options,
          Map<String, dynamic> requestClass) =>
      _getSwaggerRequestsGenerator(dartCode).generate(
          code: dartCode, className: className, fileName: fileName, options: options, requestClass: requestClass);

  String generateCustomJsonConverter(String dartCode, String fileName, GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator(dartCode, options).generateCustomJsonConverter(fileName, options);

  String generateDateToJson(String dartCode, GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator(dartCode, options).generateDateToJson();

  SwaggerAdditionsGenerator _getSwaggerAdditionsGenerator(String dartCode, GeneratorOptions options) =>
      SwaggerAdditionsGenerator();

  SwaggerConverterGenerator _getSwaggerConverterGenerator(String dartCode) => SwaggerConverterGenerator();

  SwaggerEnumsGenerator _getSwaggerEnumsGenerator(String dartCode) => _enumsMap[_getApiVersion(dartCode)]!;

  SwaggerModelsGenerator _getSwaggerModelsGenerator(String dartCode) => _modelsMap[_getApiVersion(dartCode)]!;

  SwaggerRequestsGenerator _getSwaggerRequestsGenerator(String dartCode) => SwaggerRequestsGenerator();
}
