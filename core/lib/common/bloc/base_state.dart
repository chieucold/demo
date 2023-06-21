
abstract class BaseStateBloc<T>{
  final T model;
  BaseStateBloc(this.model);
}

class InitState<T> extends BaseStateBloc<T> {
  InitState(T model) : super(model);
}

class LoadingState<T> extends BaseStateBloc<T> {
  LoadingState(T model) : super(model);
}

class LoadedState<T> extends BaseStateBloc<T> {
  LoadedState(T model) : super(model);
}

class ErrorState<T> extends BaseStateBloc<T> {
  ErrorState(T model) : super(model);
}
