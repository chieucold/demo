import 'package:core/common/enums/editor_enum.dart';
import 'package:core/components/form/form_builder_field.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

// ignore: must_be_immutable
class BNDEditor extends FormBuilderField<String> {
  final double? height;
  final String? hintText;
  final EditorToolbarEnum toolbarType;
  final List<Toolbar>? toolbars;
  BNDEditor(
      {Key? key,
      String name = "",
      ValueChanged<String?>? onChanged,
      FormFieldValidator<String?>? validator,
      String initialValue = "",
      InputDecoration decoration = const InputDecoration(border: InputBorder.none, enabledBorder: InputBorder.none),
      this.height,
      this.toolbarType = EditorToolbarEnum.basic,
      this.toolbars,
      this.hintText})
      : super(
          key: key,
          name: name,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          builder: (FormFieldState<String?> field) {
            final _BNDEditorState state = field as _BNDEditorState;
            return InputDecorator(
              decoration: decoration,
              child: state.buildBody(state.context),
            );
          },
        );

  @override
  _BNDEditorState createState() => _BNDEditorState();
}

class _BNDEditorState extends FormBuilderFieldState<BNDEditor, String> {
  late HtmlEditorController controller;
  EditorToolbarEnum get toolbarType => widget.toolbarType;
  String? get _hintText => widget.hintText;
  List<Toolbar> get toolbars => widget.toolbars != null
      ? widget.toolbars!
      : (toolbarType == EditorToolbarEnum.basic
          ? <Toolbar>[
              //const InsertButtons(),
              const FontButtons(),
              const FontSettingButtons(),
            ]
          : <Toolbar>[
              const StyleButtons(),
              const FontSettingButtons(),
              const InsertButtons(),
              const FontButtons(),
              const ColorButtons(),
              const ListButtons(),
              const ParagraphButtons(),
              const OtherButtons(),
            ]);

  @override
  void initState() {
    controller = HtmlEditorController();
    super.initState();
  }

  Widget buildBody(BuildContext context) {
    return HtmlEditor(
      htmlEditorOptions: HtmlEditorOptions(
        hint: AppLocalizations.of(context)!.translate(widget.hintText ?? 'editor_hint_text'),
        shouldEnsureVisible: true,
        initialText: initialValue,
      ),
      controller: controller,
      callbacks: Callbacks(onChangeContent: (String? currentHtml) {
        didChange(currentHtml);
      }),
      otherOptions: OtherOptions(height: widget.height ?? MediaQuery.of(context).size.height),
      htmlToolbarOptions: HtmlToolbarOptions(
        toolbarPosition: ToolbarPosition.belowEditor,
        defaultToolbarButtons: toolbars,
      ),
    );
  }
}
