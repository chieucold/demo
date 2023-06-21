import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/constants/packages.dart';
import 'package:core/common/core_module.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/bnd_show_image_url.dart';
import 'package:core/components/bnd_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../common/constants/const/enum.dart';

Widget BNDImage({
  String? imageUrl,
  BoxFit? fit,
  Widget? imageDefault,
  File? file,
  Uint8List? data,
  double? width,
  double? height,
  double? radius,
  String? package,
  Color? color,
  bool isCrop = true,
  bool isShowLoading = true,
  bool viewImage = false,
  String imageCropMode = 'crop',
}) {
  if (imageUrl != null && imageUrl.trim().isNotEmpty) {
    if (imageUrl.contains("http")) {
      switch (getMediaType(imageUrl)) {
        default:
          return GestureDetector(
            onTap: viewImage == false ? null : () => bndShowDialog(navigatorKey!.currentState!.context, imageUrl),
            child: CachedNetworkImage(
                imageUrl: isCrop
                    ? Utils.thumbnailImage(imageUrl, width: width, height: height, mode: imageCropMode)
                    : imageUrl,
                width: width,
                height: height,
                imageBuilder: (width != null && height != null)
                    ? (BuildContext context, ImageProvider _imageUrl) {
                        return Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius ?? 0),
                            image: DecorationImage(
                                image: imageUrl.contains('.gif') ? NetworkImage(imageUrl) : _imageUrl,
                                fit: fit ?? BoxFit.contain),
                          ),
                          // child: Image.network(imageUrl, fit: fit ?? BoxFit.contain),
                        );
                      }
                    : null,
                placeholder: (_, __) => isShowLoading
                    ? const SpinKitCircle(
                        color: Colors.white,
                        size: 50.0,
                      )
                    : const SizedBox(),
                fit: fit,
                errorWidget: (_, __, dynamic error) {
                  return imageDefault ?? _buildImageDefault(fit, width, height, radius);
                }),
          );
      }
    } else if (imageUrl.contains('data')) {
      return Image.file(
        File(imageUrl),
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      return Image.asset(
        imageUrl,
        package: package ?? packageCore,
        fit: fit,
        width: width,
        height: height,
        color: color,
      );
    }
  } else if (file != null) {
    return Image.file(
      file,
      fit: fit,
      width: width,
      height: height,
    );
  } else if (data != null) {
    return Image.memory(
      data,
      fit: fit,
      width: width,
      height: height,
    );
  }

  return imageDefault ?? _buildImageDefault(fit, width, height, radius);
}

Widget _buildImageDefault(BoxFit? fit, double? width, double? height, double? radius) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0),
      image: DecorationImage(
        image: const AssetImage(Images.imageDefault, package: "core"),
        fit: fit ?? BoxFit.contain,
      ),
    ),
  );
}

MediaType getMediaType(String path) {
  if (getVideo(path)) {
    return MediaType.mp4;
  } else if (path.contains('http')) {
    if (path.contains('sticker')) {
      return MediaType.sticker;
    } else if (path.contains('svg')) {
      return MediaType.svgNetwork;
    } else if (path.contains('jpg') ||
        path.contains('jpeg') ||
        path.contains('JPG') ||
        path.contains('png') ||
        path.contains('.gif')) {
      return MediaType.jpgNetwork;
    } else if (path.contains('mp4')) {
      return MediaType.mp4;
    }
    return MediaType.file;
  } else if (path.contains("data")) {
    return MediaType.file;
  } else if (path.contains('svg')) {
    return MediaType.svgLocal;
  } else if (path.contains('png') || path.contains('jpg') || path.contains('JPG') || path.contains('jpeg')) {
    return MediaType.pngLocal;
  }
  return MediaType.waiting;
}

bool getVideo(String path) =>
    path.contains("mp4") || path.contains("MP4") || path.contains("MOV") || path.contains("mov");
