import 'dart:io';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/components/comment/bloc/bnd_comment_bloc.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/upload/bnd_upload.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/file_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'bloc/bnd_comment_reply_bloc.dart';
import 'bloc/bnd_comment_reply_state.dart';

class BNDCommentForm extends StatefulWidget {
  final ScrollController controller;
  BNDCommentForm({Key? key, required this.controller}) : super(key: key);

  @override
  _BNDCommentFormState createState() => _BNDCommentFormState();
}

class _BNDCommentFormState extends State<BNDCommentForm> {
  late FocusNode myFocusNode;
  List<String> allowedExtensions = <String>["png", "jpg", "gif"];
  String imageUrl = "";
  double processUpload = 0;
  late String? _parentId;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _parentId = "";
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 40),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: CoreColor.borderLineCommentColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (imageUrl != "")
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BNDImage(
                      file: File(imageUrl),
                      height: 50,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: GestureDetector(
                    onTap: _onDeleteImage,
                    child: Container(
                      width: 10,
                      height: 10,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CoreColor.borderLineCommentColor,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 10,
                        color: CoreColor.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          BlocBuilder<BNDCommentReplyBloc, BNDCommentReplyState>(
            builder: (BuildContext context, BNDCommentReplyState state) {
              if (state is BNDCommentReplyLoaded) {
                _focusKeyboard(state.nameTag, state.parentId);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  if (imageUrl == "")
                    Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          _onSelectImage();
                        },
                        child: Images.svgAssets(
                          Images.icChooseImageComment,
                          width: 22,
                          height: 20,
                          package: 'core',
                        ),
                      ),
                    ),
                  Expanded(
                    child: Container(
                      // height: 22,
                      child: TextFormField(
                        controller: _textEditingController,
                        minLines: 1,
                        maxLines: 3,
                        focusNode: myFocusNode,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 15, right: 15),
                            hintText: ""),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _onSend(_parentId);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10, right: 10),
                      child: Images.svgAssets(Images.icSendComment, width: 22, height: 20),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _focusKeyboard(String text, String? parentId) {
    _parentId = parentId;
    FocusScope.of(context).requestFocus(myFocusNode);
    _textEditingController.text = text;
    _textEditingController.selection =
        TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length));
  }

  Future<void> _onSelectImage() async {
    final PickedFile? pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    // final FilePickerResult? result = await Utils()
    //     .openChooseFiles(type: FileType.custom, allowedExtensions: allowedExtensions, allowMultiple: false);
    if (pickedFile != null) {
      final String path = pickedFile.path;
      imageChanged(path);
    }
  }

  void imageChanged(String path) {
    setState(() {
      imageUrl = path;
      print(imageUrl);
    });
  }

  void _onDeleteImage() {
    setState(() {
      imageUrl = "";
    });
  }

  Future<void> _onSend(String? parentId) async {
    if ((_textEditingController.text == null || _textEditingController.text.trim().isEmpty) && imageUrl == '') {
      showErrorMessage(AppLocalizations.of(context)!.translate('comments_cannot_be_left_blank'));
      return;
    }
    final BNDCommentBloc bloc = BlocProvider.of<BNDCommentBloc>(context);

    if (imageUrl != "") {
      showLoading();
      await uploadFile(
        imageUrl,
        onUploadComplete: (FileInfo? data) async {
          if (data != null) imageChanged(data.pathWithDomain);
          hideLoading();
          await bloc.createComment(_textEditingController.text, imageUrl, paramParentId: parentId);
          BlocProvider.of<BNDCommentReplyBloc>(context).initial();
          _clearInputComment();
        },
        onProgress: (double process) {
          setState(() {
            processUpload = process;
          });
        },
      );
    } else {
      await bloc.createComment(_textEditingController.text, imageUrl, paramParentId: parentId);
      BlocProvider.of<BNDCommentReplyBloc>(context).initial();
      _clearInputComment();
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await widget.controller.animateTo(
        widget.controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    }
  }

  void _clearInputComment() {
    _textEditingController.clear();
    FocusScope.of(context).unfocus();
    _onDeleteImage();
  }
}
