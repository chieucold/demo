// import 'package:core/assets/images/images.dart';
// import 'package:core/common/constants/block_settings.dart';
// import 'package:core/common/enums/block_enum.dart';
// import 'package:exam/core/theme/custom.dart';
// import 'package:core/common/text_style.dart';
// import 'package:core/components/appbar/app_bar_background.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vitan_edu/features/presentation/vsr/vsr3_search/view/page/vsr3_search_screen.dart';
// import 'package:vitan_edu/features/route/route_goto.dart';
// import 'package:core/common/route/open_container_wrapper.dart';

// PreferredSize AppBarHomeSupperApp(BuildContext context, {String? title}) {
//   return PreferredSize(
//     preferredSize: const Size.fromHeight(40),
//     child: AppBar(
//       systemOverlayStyle: SystemUiOverlayStyle.light,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       title: Text(
//         title ?? 'Supper App',
//         style: textStyleHeadline6Default.copyWith(color: CustomTheme.textWhiteColor),
//       ),
//       centerTitle: false,
//       actions: [
//         Container(
//           // margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
//           margin: EdgeInsets.fromLTRB(0, 4, 12, 4),
//           // padding: EdgeInsets.symmetric(horizontal: 12),
//           child: OpenContainerWrapper(
//             closedBuilder: (BuildContext _, VoidCallback openContainer) {
//               return InkWell(
//                 onTap: openContainer,
//                 child: Container(
//                   // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: CustomTheme.white),
//                   child: Images.svgAssets(Images.icSearch,
//                       width: 14, height: 14, color: CustomTheme.cricleBackgroundColor),
//                 ),
//               );
//             },
//             openRadius: 16,
//             // openElevation: 0.0,
//             // closedElevation: 0.0,
//             // closedColor: CustomTheme.transparent,
//             // openColor: CustomTheme.transparent,
//             // transitionDuration: Duration(milliseconds: 5000),
//             pageGoTo:
//                 VSR3SearchScreen(blockModel: listBlockWithVitan.firstWhere((e) => e.id == BlockEnum.SupperApp.index)),
//           ),
//         )
//       ],
//       flexibleSpace: Container(
//           height: double.infinity,
//           color: CustomTheme.primaryColor,
//           child: appBarBackgroundWidget(color: CustomTheme.supperAppThemeColor)),
//     ),
//   );
// }
