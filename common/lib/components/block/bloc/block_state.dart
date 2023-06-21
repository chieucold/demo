import 'package:core/common/constants/block_settings.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BlockState {}

class BlockInitial extends BlockState {}

class BlockLoading extends BlockState {}

class BlockLoaded extends BlockState {
  final List<BlockModel> listBlock;

  BlockLoaded({required this.listBlock});
}

class BlockError extends BlockState {
  final String contentError;

  BlockError({required this.contentError});
}
