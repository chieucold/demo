import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';
import 'package:core/common/enums/advertisement_enum.dart';
import 'package:core/repositories/advertisement_repository/advertisement_repository.dart';
import 'package:core/repositories/object/object_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@injectable
class ObjectUseCases {
  final ObjectRepository objectRepository;
  ObjectUseCases(this.objectRepository);

  Future<Either<String, SystemObjectResourceFilterResult>> systemObjectGetList(SystemObjectFilterResource param) async {
    try {
      final SystemObjectResourceFilterResult data = await objectRepository.systemObjectGetList(param);
      return Right<String, SystemObjectResourceFilterResult>(data);
    } catch (ex) {
      return Left<String, SystemObjectResourceFilterResult>(ex.toString());
    }
  }
}
