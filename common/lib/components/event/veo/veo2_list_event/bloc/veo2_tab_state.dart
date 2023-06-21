
import 'package:api/common/model/common_index.dart';

abstract class VEO2TabState {
  CountTabEventModel tabEventModel;

  VEO2TabState({required this.tabEventModel});
}

class VEO2TabInitial extends VEO2TabState {
  VEO2TabInitial() : super(tabEventModel: CountTabEventModel());
}

class VEO2TabLoaded extends VEO2TabState {
  final CountTabEventModel tabModel;
  VEO2TabLoaded({required this.tabModel}) : super(tabEventModel: tabModel);
}
