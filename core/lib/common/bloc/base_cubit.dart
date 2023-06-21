// ignore_for_file: prefer_mixin

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Là một cách triển khai khác của bloc
/// Thay vì add event như bloc thì cubit chỉ cần emit một state mới
/// Các hàm trong BaseCubit xử lí tương tự như BaseBloc
/// Example
///
/// class TestBloc extends BaseCubit<BaseStateBloc<String>> {
///   TestBloc() : super(InitState<String>(''));
///
///
///   @override
///   Future<void> init() async{
///     // call khi khởi tạo bloc
///     refresh();
///   }
///
///  @override
///   Future<void> refresh()async {
///     emit(LoadingState());
///     await getData();
///     await Future.delayed(Duration(seconds: 5));
///    await loadMore();
///   }
///
///   @override
///   Future<List<int>> getData()async {
///     logger.d('getData');
///     return [5,6,7,8];
///   }
///
///   @override
///   Future<List<int>> loadMore() async{
///     logger.d('loadMore');
///     emit(LoadedState(data: [1,2,3,4]));
///     return [1,2,3,4];
///   }
///
///
///  @override
///   void dispose() {
///     // call khi kill widget
///  }
///
/// }
///
abstract class BaseCubit<BaseStateBloc> extends Cubit<BaseStateBloc> with WidgetsBindingObserver{
  BaseCubit(BaseStateBloc initialState) : super(initialState);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print("resumed");
    }
    if (state == AppLifecycleState.paused) {
      print("paused");
    }
    if (state == AppLifecycleState.inactive) {
      print("inactive");
    }
  }



  @protected
  Future<dynamic> getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @protected
  Future<dynamic> loadMore() {
    // TODO: implement loadMore
    throw UnimplementedError();
  }

  @protected
  Future<dynamic> refresh() {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @protected
  void dispose() {
    // TODO: implement dispose
  }

  @protected
  void init() {
    // TODO: implement init
  }
}


