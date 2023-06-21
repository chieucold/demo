import 'package:core/assets/images/images.dart';
import 'package:core/common/common.dart';
import 'package:core/components/bnd_gesture_detector.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/components/upload/bloc/bnd_upload_file_bloc.dart';
import 'package:core/components/upload/bloc/bnd_upload_file_view_model.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/file_info.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';

typedef void onUploadComplete(List<FileInfo> data);
typedef void onDelete(String fileName);

class BNDUploadFile extends StatefulWidget {
  const BNDUploadFile({
    Key? key,
    this.maxLength = 0,
    this.allowExtensions = const <String>["doc", "pdf", "mp4", "mp3", "png", "jpg"],
    this.textStyle,
    this.iconColor,
    this.subTextStyle,
    this.borderColor = const Color(0xffD5DBE2),
    this.allowMultiple = false,
    this.autoUpload = true,
    this.onSuccess,
    this.onFileDelete,
  }) : super(key: key);
  final int maxLength;
  final List<String> allowExtensions;
  final TextStyle? textStyle;
  final Color? iconColor;
  final TextStyle? subTextStyle;
  final Color borderColor;
  final bool allowMultiple;
  final bool autoUpload;
  final onUploadComplete? onSuccess;
  final onDelete? onFileDelete;

  @override
  _BNDUploadFileState createState() => _BNDUploadFileState();
}

class _BNDUploadFileState extends State<BNDUploadFile> {
  int get maxCapacity => widget.maxLength;
  List<String> get _allowExtensions => widget.allowExtensions;
  Color get _borderColor => widget.borderColor;
  final List<String> _paths = <String>[];
  bool isStartUpload = false;
  List<FileInfo> files = <FileInfo>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_buildInitial(context), _buildUploading()],
    );
  }

  Widget _uploadWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Images.svgAssets(
              Images.icUploadFile,
              package: 'core',
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              AppLocalizations.of(context)!.translate("upload"),
              style: widget.textStyle,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        if (widget.maxLength > 0)
          Text(
            AppLocalizations.of(context)!.translate("max_capacity") + " ${widget.maxLength} Mb",
            style: widget.subTextStyle,
          ),
        if (_allowExtensions != null && _allowExtensions.length > 0)
          GestureDetector(
            onTap: () {
              showMessage(_allowExtensions.join(", "));
            },
            child: Text(
              AppLocalizations.of(context)!.translate("show_support_file_type"),
              style: widget.subTextStyle != null
                  ? widget.subTextStyle!.copyWith(decoration: TextDecoration.underline)
                  : null,
            ),
          )
      ],
    );
  }

  void _startUpload() {
    setState(() {
      _paths;
    });
  }

  Widget _buildUploading() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 6,
          );
        },
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          return BNDUploadOneFile(
            filePath: _paths[index],
            onSuccess: (FileInfo? file) {
              if (file != null) {
                files.add(file);
                if (widget.onSuccess != null && files.length == _paths.length) {
                  widget.onSuccess!(files);
                }
              }
            },
            onDelete: (String path) {
              setState(() {
                _paths.removeWhere((String element) => element == path);
                files.removeWhere((FileInfo element) => element.name == Utils.getFileName(path));
              });
              if (widget.onFileDelete != null) widget.onFileDelete!(Utils.getFileName(path));
            },
          );
        },
        itemCount: _paths.length,
      ),
    );
  }

  Widget _buildInitial(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final FilePickerResult? result = await Utils().openChooseFiles(
              type: FileType.custom, allowedExtensions: widget.allowExtensions, allowMultiple: widget.allowMultiple);
          if (result != null) {
            final List<String> temps = result.files
                .where((PlatformFile element) =>
                    element.path != null && element.path!.isNotEmpty && !_paths.contains(element.path))
                .map((PlatformFile e) => e.path!)
                .toList();
            _paths.addAll(temps);

            _startUpload();
          }
        },
        child: _itemWidget(_uploadWidget(context)));
  }

  Widget _itemWidget(Widget? widget) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderColor),
      ),
      child: widget,
    );
  }
}

class BNDUploadOneFile extends StatefulWidget {
  ///Theo Mb
  final int maxLength;
  final List<String> allowExtensions;
  final TextStyle? textStyle;
  final Color? iconColor;
  final TextStyle? subTextStyle;
  final Color borderColor;
  final bool allowMultiple;
  final bool autoUpload;
  final Function? onSuccess;
  final String filePath;
  final Color uploadProcessColor;
  final TextStyle uploadProcessPercentTextStyle;
  final TextStyle uploadProcessErrorTextStyle;
  final Function? onDelete;

  BNDUploadOneFile({
    Key? key,
    this.maxLength = 0,
    this.allowExtensions = const <String>["doc", "pdf", "mp4", "mp3", "png"],
    this.textStyle,
    this.iconColor,
    this.subTextStyle,
    this.borderColor = const Color(0xffD5DBE2),
    this.allowMultiple = false,
    this.autoUpload = true,
    this.onSuccess,
    required this.filePath,
    this.uploadProcessColor = const Color(0xff2EADC9),
    this.uploadProcessPercentTextStyle = const TextStyle(fontSize: 12, color: Color(0xffD1D6DE)),
    this.uploadProcessErrorTextStyle = const TextStyle(fontSize: 12, color: Color(0xffC11C3A)),
    this.onDelete,
  }) : super(key: key);

  @override
  _BNDUploadOneFileState createState() => _BNDUploadOneFileState();
}

class _BNDUploadOneFileState extends State<BNDUploadOneFile> {
  int get maxCapacity => widget.maxLength;
  List<String> get allowExtensions => widget.allowExtensions;
  Color get _borderColor => widget.borderColor;
  TextStyle? get _textStyle => widget.textStyle;
  String get _filePath => widget.filePath;
  Color get _uploadProcessColor => widget.uploadProcessColor;

  late BNDUploadFileBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BNDUploadFileBloc>(
      create: (BuildContext context) => _bloc..init(_filePath, widget.autoUpload, widget.onSuccess),
      child: BlocBuilder<BNDUploadFileBloc, BNDUploadFileState>(
        builder: (BuildContext context, BNDUploadFileState state) {
          final BNDUploadFileViewModel viewModel = state.viewModel;
          if (state is BNDUploadFileUploading) return _uploadingWidget(viewModel, state.percent);
          if (state is BNDUploadFileSuccess) return _uploadSuccessWidget(viewModel, DateTime.now());
          if (state is BNDUploadFileError) return _uploadFailWidget(viewModel, "");

          return const SizedBox();
        },
      ),
    );
  }

  Widget _itemWidget(Widget? widget) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderColor),
      ),
      child: widget,
    );
  }

  Widget _buildCancel(String filePath) {
    return Positioned(
      right: 10,
      top: 10,
      child: BndGestureDetector(
        onTap: () {
          showAlertDialog(context,
              cancelText: AppLocalizations.of(context)!.translate("close"),
              okText: AppLocalizations.of(context)!.translate("delete"), onOk: () {
            _bloc.stopUpload();
            if (widget.onDelete != null) widget.onDelete!(filePath);
          }, content: AppLocalizations.of(context)!.translate("are_you_sure_delete_file"));
        },
        child: Images.svgAssets(
          Images.icClear,
          package: 'core',
          color: _borderColor,
        ),
      ),
    );
  }

  Widget _uploadingWidget(BNDUploadFileViewModel viewModel, int percent) {
    return Stack(children: <Widget>[
      _itemWidget(
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Images.svgAssets(
                  Images.icUploading,
                  package: 'core',
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Text(
                    viewModel.name ?? "",
                    style: _textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            LinearProgressIndicator(
              value: percent / 100,
              valueColor: AlwaysStoppedAnimation<Color>(_uploadProcessColor),
              backgroundColor: _uploadProcessColor.withOpacity(0.2),
            ),
            const SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${AppLocalizations.of(context)!.translate("uploading")} $percent%",
                style: widget.uploadProcessPercentTextStyle,
              ),
            ),
          ],
        ),
      ),
      _buildCancel(viewModel.path ?? "")
    ]);
  }

  Widget _uploadSuccessWidget(BNDUploadFileViewModel viewModel, DateTime timeUploaded) {
    return Stack(children: <Widget>[
      _itemWidget(
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Images.svgAssets(
                  Images.icUploadSuccess,
                  package: 'core',
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Text(
                    viewModel.name ?? "",
                    style: _textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.translate("upload_at") +
                  " " +
                  AppLocalizations.of(context)!.displayTime(timeUploaded),
              style: widget.uploadProcessPercentTextStyle,
            )
          ],
        ),
      ),
      _buildCancel(viewModel.path ?? "")
    ]);
  }

  Widget _uploadFailWidget(BNDUploadFileViewModel viewModel, String error) {
    return Stack(children: <Widget>[
      _itemWidget(
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Images.svgAssets(
                  Images.icUploadFail,
                  package: 'core',
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Text(
                    viewModel.name ?? "",
                    style: _textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.translate("error_upload_file"),
              style: widget.uploadProcessErrorTextStyle,
            )
          ],
        ),
      ),
      _buildCancel(viewModel.path ?? ""),
      Positioned(
        right: 36,
        top: 10,
        child: GestureDetector(
          onTap: () {
            _bloc.upload();
          },
          child: Images.svgAssets(
            Images.icReload,
            package: 'core',
            color: _borderColor,
            height: 14,
          ),
        ),
      )
    ]);
  }
}
