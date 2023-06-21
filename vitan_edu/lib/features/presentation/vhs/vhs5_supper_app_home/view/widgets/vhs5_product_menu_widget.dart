import 'package:core/assets/images/images.dart';
import 'package:core/common/common.dart';
import 'package:core/common/dimension.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/block/widgets/block_item_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:vitan_edu/core/theme/custom.dart';

class BuildProductMenu extends StatelessWidget {
  final List<BlockModel> listBlock;
  const BuildProductMenu({Key? key, required this.listBlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.textWhiteColor,
      margin: CustomTheme.paddingBodyDefault,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            _buildList(context, listBlock.where((element) => element.mainFunction == true).toList()),
            Divider(height: 32, color: CustomTheme.colorSliderPagging, thickness: 1),
            _buildList(context, listBlock.where((element) => element.mainFunction == false).toList())
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<BlockModel> _list) {
    return ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemBuilder: (_, int index) {
          final BlockModel item = _list[index];
          return BndTouch(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_) => TestScreen()));
                if (item.isActive)
                  Navigator.pushNamed(context, item.routeName);
                else
                  showMessage(AppLocalizations.of(context)!.translate('the_function_is_developing'));
              },
              child: BlockItemWidget(item: item));
        },
        separatorBuilder: (_, __) => SizedBox(height: 12),
        itemCount: _list.length);
  }

  Widget _buildListGrid(BuildContext context, List<BlockModel> _list) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: isTablet(context) ? 6 : 2.5,
      children: List<Widget>.generate(_list.length, (int index) {
        final BlockModel item = _list[index];
        return BndTouch(
            onPressed: () {
              if (item.isActive)
                Navigator.pushNamed(context, item.routeName);
              else
                showMessage(AppLocalizations.of(context)!.translate('the_function_is_developing'));
            },
            child: Container(
              margin: const EdgeInsetsDirectional.all(2),
              child: Row(
                children: <Widget>[
                  Container(
                    // foregroundDecoration: item.id != BlockEnum.Exam.index
                    //     ? BoxDecoration(
                    //         color: Colors.grey,
                    //         backgroundBlendMode: BlendMode.saturation,
                    //       )
                    //     : null,
                    // width: 50,
                    // height: 50,
                    // decoration: BoxDecoration(
                    //   color: item.backgroundColor,
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: Center(
                      child: Images.svgAssets(item.icon),
                      // child: Icon(
                      //   item.icon,
                      //   color: CustomTheme.textWhiteColor,
                      //   size: 25,
                      // ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(start: height(context, 10)),
                      alignment: AlignmentDirectional.bottomStart,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              AppLocalizations.of(context)!.translate(item.title),
                              style: textStyleBodyDefault.copyWith(color: CustomTheme.textColor, fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      }),
    );
  }
}
