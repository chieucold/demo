import 'package:core/assets/images/images.dart';
import 'package:core/common/common.dart';
import 'package:core/common/constants/packages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BNDSelectFile extends StatefulWidget {
  const BNDSelectFile(
      {Key? key,
      this.path = "",
      this.width,
      this.height,
      this.multiple = false,
      this.allowedExtensions = const <String>["doc", "pdf", "mp4", "mp3"],
      this.boxFit,this.onTap})
      : super(key: key);

  final String path;
  final double? width;
  final double? height;
  final bool multiple;
  final List<String> allowedExtensions;
  final BoxFit? boxFit;
  final Function(FilePickerResult? file)? onTap;

  @override
  State<BNDSelectFile> createState() => _BNDSelectFileState();
}

class _BNDSelectFileState extends State<BNDSelectFile> {
  @override
  Widget build(BuildContext context) {
    return _buildDefaultEditWidget();
  }

  Widget _buildDefaultEditWidget() {
    return GestureDetector(
      onTap: () async {
        final FilePickerResult? result = await Utils().openChooseFiles(
            allowedExtensions: widget.allowedExtensions, type: FileType.custom, allowMultiple: widget.multiple);
        if(result != null && widget.onTap != null){
          widget.onTap!(result);
        }
        // if (result != null && widget.onPicker != null) {
        //   print(result.files[0].name.split('.').last);
        //   widget.onPicker!(result);
          // final String path = result.files;
          // if (widget.onPath != null) {
          //   for (final PlatformFile file in result.files) {
          //     widget.onPath!(file.path ?? "");
          //   }
          // }
        // }
      },
      child: Images.svgAssets(
        widget.path == '' ? Images.icEdit : widget.path,
        package: packageCore,
      ),
    );
  }
}
