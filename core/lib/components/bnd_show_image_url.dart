import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/assets/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photo_view/photo_view.dart';

void bndShowDialog(BuildContext context, String url) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    // barrierColor: Colors.black.withOpacity(0.6),
    transitionDuration: const Duration(milliseconds: 350),
    context: context,
    pageBuilder: (_, __, ___) {
      return BNDShowImageUrl(url: url);
    },
    transitionBuilder: (_, Animation<double> anim, __, Widget child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}

class BNDShowImageUrl extends StatelessWidget {
  final String url;
  BNDShowImageUrl({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        alignment: Alignment.center,
        child: _buildPhotoView(context, url),
      ),
    );
    // return Dialog(
    //   child: Container(
    //     height: MediaQuery.of(context).size.height * 1 / 2,
    //     child: Center(
    //       child: Hero(
    //         tag: url,
    //         child: BNDImage(imageUrl: url, fit: BoxFit.fitWidth),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _buildImage(String imageUrl) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (BuildContext context, ImageProvider imageUrl) {
          return Container(
            decoration: BoxDecoration(image: DecorationImage(image: imageUrl, fit: BoxFit.contain)),
          );
        },
        placeholder: (_, __) => const SpinKitCircle(
              color: Colors.white,
              size: 50.0,
            ),
        errorWidget: (_, __, dynamic error) {
          return _buildImageDefault();
        });
  }

  Widget _buildImageDefault() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.imageDefault, package: "core"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildPhotoView(BuildContext context, String imageUrl) {
    return Container(
      child: PhotoView(
        imageProvider: NetworkImage(imageUrl),
        loadingBuilder: (_, __) => const SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
        errorBuilder: (_, __, ___) => _buildImageDefault(),
        backgroundDecoration: const BoxDecoration(color: Colors.transparent),
        maxScale: PhotoViewComputedScale.covered * 4.0,
        minScale: PhotoViewComputedScale.contained * 1,
        
        // onTapDown: (_, __, ___) => Navigator.pop(context),
        // initialScale: PhotoViewComputedScale.covered,
      ),
    );
  }
}
