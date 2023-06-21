import 'package:common/components/block/bloc/block_bloc.dart';
import 'package:common/components/block/bloc/block_state.dart';
import 'package:core/common/common.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/loading_widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs5_supper_app_home/view/widgets/vhs5_product_menu_widget.dart';

class VHS5BlockListWidget extends StatelessWidget {
  VHS5BlockListWidget({Key? key}) : super(key: key);

  final BlockBloc _blockBloc = getItSuper<BlockBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlockBloc>(
      create: (_) => _blockBloc..refresh(),
      child: BlocBuilder<BlockBloc, BlockState>(
        builder: (BuildContext context, BlockState state) {
          if (state is BlockInitial) {
            return const SizedBox();
          } else if (state is BlockLoading) {
            return LoadingWidget(LoadingEnum.blockList);
            // return SizedBox();
          } else if (state is BlockLoaded) {
            return BuildProductMenu(listBlock: state.listBlock);
          }
          if (state is BlockError) {
            return BnDNoData();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
