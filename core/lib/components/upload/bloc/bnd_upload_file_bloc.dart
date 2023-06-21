import 'package:bloc/bloc.dart';
import 'package:core/common/common.dart';
import 'package:core/components/upload/bloc/bnd_upload_file_view_model.dart';
import 'package:core/components/upload/bnd_upload.dart';
import 'package:core/components/upload/src/client.dart';
import 'package:core/model/file_info.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'bnd_upload_file_state.dart';
@lazySingleton
class BNDUploadFileBloc extends Cubit<BNDUploadFileState> {
  BNDUploadFileBloc() : super(BNDUploadFileInitial(""));

  BNDUploadFileViewModel get _viewModel => state.viewModel;
  Function? onUploadSuccess;

  late TusClient? _clientUpload;

  void init(String path, bool autoUpload, Function? onUploadSuccess) {
    this.onUploadSuccess = onUploadSuccess;
    emit(BNDUploadFileInitial(path));
    upload();
  }

  Future<void> upload() async {
    updateStateUploading(0);
    _clientUpload = await uploadFile(_viewModel.path ?? "", onProgress: (double progress) {
      updateStateUploading(progress.toInt());
    }, onUploadComplete: (FileInfo? fileInfo) {
      emit(BNDUploadFileSuccess(_viewModel));
      if (onUploadSuccess != null) onUploadSuccess!(fileInfo);
    }, onError: () {
      emit(BNDUploadFileError(_viewModel));
    });
  }

  void updateStateUploading(int percent) {
    emit(BNDUploadFileUploading(_viewModel, percent));
  }

  void stopUpload() {
    try {
      if (_clientUpload != null) _clientUpload!.pause();
    } catch (e) {}
  }
}
