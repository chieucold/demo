import 'dart:typed_data';

import 'package:core/assets/images/images.dart';
import 'package:core/common/constants/packages.dart';
import 'package:core/common/loading.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/bnd_avatar.dart';
import 'package:core/components/bnd_gesture_detector.dart';
import 'package:core/components/bnd_image.dart';
import 'package:core/components/upload/bnd_upload.dart';
import 'package:core/model/file_info.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:cross_file/cross_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef void OnChanged(String? imagePath);

class BNDSelectImage extends StatefulWidget {
  const BNDSelectImage(
      {Key? key,
      this.editWidget,
      this.imageData,
      this.imageUrl = "",
      this.path = "",
      this.top,
      this.left,
      this.bottom,
      this.right,
      this.width,
      this.height,
      this.allowedExtensions = const <String>["png", "jpg", "gif"],
      this.uploadAfterChoose = false,
      this.isMultiple = false,
      this.isBorderIcon = false,
      this.onChanged,
      this.borderRadius = 0,
      this.decoration = const BoxDecoration(),
      this.boxFit,
      this.title = "",
      this.defaultWidget,
      this.onPath,
      this.viewImage = false,
      this.selectImage = false})
      : super(key: key);

  final Function(String path)? onPath;
  final Widget? editWidget;
  final Uint8List? imageData;
  final String imageUrl;
  final String path;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final double? width;
  final double? height;
  final List<String> allowedExtensions;
  final bool uploadAfterChoose;
  final bool isMultiple;
  final bool isBorderIcon;
  final OnChanged? onChanged;
  final double borderRadius;
  final BoxDecoration decoration;
  final BoxFit? boxFit;
  final String title;
  final Widget? defaultWidget;
  final bool viewImage;
  final bool selectImage;

  @override
  _BNDSelectImageState createState() => _BNDSelectImageState();
}

class _BNDSelectImageState extends State<BNDSelectImage> {
  String imageUrl = "";
  String path = "";
  Uint8List? imageData;
  double processUpload = 0;

  double get borderRadius => widget.borderRadius;
  String title = "";

  double get width => widget.width ?? 0;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
    path = widget.path;
    imageData = widget.imageData;
    title = widget.title;
  }

  @override
  void didUpdateWidget(covariant BNDSelectImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title && imageUrl.isEmpty) {
      setState(() {
        title = widget.title;
      });
    }

    if (oldWidget.imageUrl != widget.imageUrl) {
      setState(() {
        imageUrl = widget.imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: widget.decoration,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: (imageUrl.isEmpty && title.trim().isNotEmpty)
                ? BnDAvatar(
                    size: width / 2,
                    name: title,
                    fit: widget.boxFit,
                    viewImage: widget.viewImage,
                  )
                : Center(
                    child: BNDImage(
                      imageUrl: imageUrl,
                      data: imageData,
                      fit: widget.boxFit ?? BoxFit.cover,
                      height: widget.height,
                      width: widget.width,
                      radius: borderRadius,
                      imageDefault: widget.defaultWidget,
                      viewImage: widget.viewImage,
                    ),
                  ),
          ),
          //_buildProcess(),
          widget.editWidget ?? _buildDefaultEditWidget(),
        ],
      ),
    );
  }

  Widget _buildDefaultEditWidget() {
    return Positioned(
      bottom: widget.bottom,
      right: widget.right,
      top: widget.top,
      left: widget.left,
      child: BndGestureDetector(
          onTap: () async {
            final List<String> path;

            if (widget.selectImage) {
              path = await _selectImage();
            } else {
              path = await _selectFile();
            }

            if (path.first.isNotEmpty) {
              if (!widget.uploadAfterChoose) {
                if (widget.onPath != null) {
                  for (final String file in path) {
                    widget.onPath!(file);
                  }
                }
              } else {
                showLoading();

                await uploadFile(
                  path.first,
                  onUploadComplete: (FileInfo? data) {
                    if (data != null) imageChanged(data.pathWithDomain);
                    hideLoading();
                  },
                  onProgress: (double process) {
                    setState(() {
                      processUpload = process;
                    });
                  },
                );
              }
            }
          },
          child: _buildIcon()),
    );
  }

  Widget _buildIcon() {
    return widget.isBorderIcon
        ? Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffE2E7EF), width: 1),
              color: Colors.white,
            ),
            child: Images.svgAssets(path == '' ? Images.icEdit : path, package: packageCore))
        : Images.svgAssets(path == '' ? Images.icEdit : path, package: packageCore);
  }

  // Widget _buildProcess() {
  //   return Positioned(
  //     child: Container(
  //       alignment: Alignment.center,
  //       color: Theme.of(context).bottomSheetTheme.modalBackgroundColor,
  //       child: BNDSlider(
  //         initialValue: processUpload,
  //         min: 0,
  //         max: 100,
  //         decoration: InputDecoration(border: InputBorder.none),
  //       ),
  //     ),
  //     top: 0,
  //     right: 0,
  //     left: 0,
  //     bottom: 0,
  //   );
  // }

  void imageChanged(String path) {
    setState(() {
      imageUrl = path;
      print(imageUrl);
    });
    if (widget.onChanged != null) widget.onChanged!(path);
  }

  Future<List<String>> _selectImage() async {
    try{
      final PickedFile? pickedFile = await _picker.getImage(
        source: ImageSource.gallery
      );
      return [pickedFile?.path ?? ''];
    }catch(e){
      print(e);
      return [];
    }
  }

  Future<List<String>> _selectFile() async {
    final FilePickerResult? result = await Utils().openChooseFiles(
        type: FileType.custom, allowedExtensions: widget.allowedExtensions, allowMultiple: widget.isMultiple);
    return [result?.files[0].path ?? ''];
  }
}
