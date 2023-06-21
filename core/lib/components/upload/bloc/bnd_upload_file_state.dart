part of 'bnd_upload_file_bloc.dart';

@immutable
abstract class BNDUploadFileState {
  final BNDUploadFileViewModel viewModel;
  BNDUploadFileState(this.viewModel);
}

class BNDUploadFileInitial extends BNDUploadFileState {
  BNDUploadFileInitial(String path) : super(BNDUploadFileViewModel(name: Utils.getFileName(path), path: path));
}

class BNDUploadFileUploading extends BNDUploadFileState {
  final int percent;
  BNDUploadFileUploading(BNDUploadFileViewModel viewModel, this.percent) : super(viewModel);
}

class BNDUploadFileSuccess extends BNDUploadFileState {
  BNDUploadFileSuccess(BNDUploadFileViewModel viewModel) : super(viewModel);
}

class BNDUploadFileError extends BNDUploadFileState {
  BNDUploadFileError(BNDUploadFileViewModel viewModel) : super(viewModel);
}
