import 'package:core/common/bnd_cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_prompt/views/widgets/vhs_prompt_widget.dart';

class VHSPromptScreen extends StatelessWidget {
  final PromptModel promptModel;
  const VHSPromptScreen({Key? key, required this.promptModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () => Future.value(false),
      shouldAddCallback: false,
      child: Scaffold(
        appBar: AppBarSupperApp(height: 0),
        body: VHSPromptWidget(promptModel: promptModel),
      ),
    );
  }
}
