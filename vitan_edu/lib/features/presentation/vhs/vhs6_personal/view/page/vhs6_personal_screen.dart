import 'package:core/components/bnd_pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/bloc/vhs6_personal_bloc.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/view/widgets/vhs6_personal_widget.dart';

class VHS6PersonalScreen extends StatefulWidget {
  VHS6PersonalScreen({Key? key, this.onInfoUpdated}) : super(key: key);
  final Function? onInfoUpdated;

  @override
  State<VHS6PersonalScreen> createState() => _VHS6PersonalScreenState();
}

class _VHS6PersonalScreenState extends State<VHS6PersonalScreen> with AutomaticKeepAliveClientMixin {
  final VHS6PersonalBloc _bloc = getItSuper();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarSupperApp(
        height: 0,
      ),
      body: BlocProvider<VHS6PersonalBloc>(
        create: (BuildContext context) => _bloc
          ..init(onInfoUpdated: widget.onInfoUpdated)
          ..updateInfo(isCallBack: false),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: VHS6PersonalWidget(bloc: _bloc),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
