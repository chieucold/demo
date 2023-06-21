import 'package:core/common/bloc/base_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseStatefulCubit<SF extends StatefulWidget, C extends BaseCubit<S>, S> extends State<SF> {
  late C cubit;
  void initCubit();
  @override
  void initState() {
    initCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildWidgets(context);
  }

  Widget buildWidgets(BuildContext context) {
    return BlocProvider<C>(
      create: (_) => cubit,
      child: BlocConsumer<C, S>(
        builder: builder,
        listener: listener,
      ),
    );
  }

  /// render view
  Widget builder(BuildContext context, S state);

  /// lắng nghe sự thay đổi của state
  void listener(BuildContext context, S state);
}
