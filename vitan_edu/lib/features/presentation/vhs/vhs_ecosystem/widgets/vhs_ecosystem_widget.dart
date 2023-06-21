import 'package:common/components/block/bloc/block_bloc.dart';
import 'package:common/components/block/bloc/block_state.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/const/enum.dart';
import 'package:core/components/bnd_pull_to_refresh.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/loading_widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs5_supper_app_home/view/widgets/vhs5_product_menu_widget.dart';

class VHSEcosystemWidget extends StatelessWidget {
  VHSEcosystemWidget({Key? key}) : super(key: key);

  final BlockBloc _blockBloc = getItSuper<BlockBloc>();
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlockBloc>(
      create: (context) => _blockBloc..getListBlock(),
      child: BNDPullToRefresh(
        controller: _refreshController,
        onRefresh: () {
          _blockBloc..refresh();
          Future<void>.delayed(const Duration(milliseconds: 500), () {
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          });
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: CoreColor.paddingBottom),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              BlocBuilder<BlockBloc, BlockState>(
                builder: (BuildContext context, BlockState state) {
                  if (state is BlockInitial) {
                    return const SizedBox();
                  } else if (state is BlockLoading) {
                    return LoadingWidget(LoadingEnum.blockList, itemCount: 10);
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
              // SizedBox(height: CoreColor.paddingBottom),
            ],
          ),
        ),
      ),
    );
  }
}
