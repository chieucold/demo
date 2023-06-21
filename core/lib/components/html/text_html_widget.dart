import 'dart:async';

import 'package:core/common/color/core_color.dart';
import 'package:core/components/audio_player/bnd_audio_player.dart';
import 'package:core/components/bnd_video_player.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math/flutter_math.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/dom.dart' as dom;
import 'package:tuple/tuple.dart';

class TextHtmlWidget extends StatefulWidget {
  const TextHtmlWidget(this.content,
      {Key? key,
        this.styles,
        this.textStyle,
        this.pattern = "",
        this.textFillStyleActives,
        this.fillAnswerStyles,
        this.maxline,
        this.isCustomShowImage = true})
      : super(key: key);

  final String content;
  final Map<String, Style>? styles;
  final TextStyle? textStyle;
  final String pattern;
  final List<TextStyle>? textFillStyleActives;
  final List<Tuple2<BoxDecoration, TextStyle>>? fillAnswerStyles;
  final int? maxline;
  final bool isCustomShowImage;

  @override
  State<TextHtmlWidget> createState() => _TextHtmlWidgetState();
}

class _TextHtmlWidgetState extends State<TextHtmlWidget> {
  final StreamController<String> _pauseStreamController = StreamController<String>.broadcast();

  @override
  void dispose() {
    super.dispose();
    _pauseStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    // xóa toàn bộ style cho đồng nhất .replaceAll(RegExp(r'style="[^\"]*"'), "")
    String htmlContent = widget.content.trim().replaceAll("\n", "");
    htmlContent = htmlContent.replaceAll("</span> <span>", "</span>&nbsp;<span>");
    final Map<String, Style> htmlStyles = widget.styles ?? <String, Style>{};
    if (!htmlStyles.containsKey("body"))
      htmlStyles.addAll(<String, Style>{
        "body": Style(
          lineHeight: LineHeight.number(1.2),
          margin: const EdgeInsets.only(left: 0, top: 0),
          fontSize: widget.textStyle != null ? FontSize(widget.textStyle!.fontSize) : const FontSize(14),
          color: (widget.textStyle != null && widget.textStyle!.color != null)
              ? widget.textStyle!.color!
              : CoreColor.textColor,
          fontWeight: (widget.textStyle != null && widget.textStyle!.fontWeight != null)
              ? widget.textStyle!.fontWeight!
              : FontWeight.normal,
        ),
        // "div": Style(border: Border.all(width: 0)),
        "#": Style(
          maxLines: widget.maxline,
          textOverflow: widget.maxline != null ? TextOverflow.ellipsis : null,
        ),
        "li": Style(lineHeight: LineHeight.number(1.2), padding: const EdgeInsets.only(top: 2, left: 4)),
      });
    if (!htmlStyles.containsKey("p"))
      htmlStyles.addAll(<String, Style>{
        "p": Style(margin: const EdgeInsets.all(0), padding: const EdgeInsets.all(0)),
      });

    // lấy ra fontSize
    final double fontSize = htmlStyles["body"]!.fontSize != null ? htmlStyles["body"]!.fontSize!.size ?? 0 : 0;
    int indexInput = 0;
    int indexSelect = 0;

    final StreamController<String> pauseStreamController = StreamController<String>.broadcast();

    return Html(
      data: htmlContent,
      style: htmlStyles,
      customRender: <String, CustomRender>{
        "span": (RenderContext context, _) {
          if (context.tree.element!.outerHtml.contains("math-tex"))
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Math.tex(
                context.tree.element!.text.replaceAll("\\(", "").replaceAll("\\)", ""),
                textStyle: widget.textStyle ?? TextStyle(fontSize: fontSize),
                onErrorFallback: (FlutterMathException e) {
                  return SingleChildScrollView(
                    child: Text(context.tree.element!.text),
                    scrollDirection: Axis.horizontal,
                  );
                },
              ),
            );
          else if (context.tree.element!.outerHtml.contains("color-txt-search")) {
            return Text(context.tree.element!.text,
                style: const TextStyle(color: Color(0xFF006600), fontSize: 16, fontWeight: FontWeight.w600, height: 1));
          }
        },
        "input": (RenderContext context, _) {
          if (context.tree.element!.outerHtml.contains("bnd-editor-input")) {
            final Widget widget = _buildInputSelect(context, indexInput);
            indexInput++;
            return widget;
          }
        },
        "select": (RenderContext context, _) {
          if (context.tree.element!.outerHtml.contains("select_")) {
            final Widget widget = _buildInputSelect(context, indexSelect);
            indexSelect++;
            return widget;
          }
        },
        "table": (RenderContext context, Widget child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: HtmlWidget(
              context.tree.element!.outerHtml,
              customWidgetBuilder: (dom.Element element) {
                if (element.attributes['table'] == 'bar') {
                  return Container();
                }
                return null;
              },
              onLoadingBuilder: (_, __, ___) => const CircularProgressIndicator(),
              renderMode: RenderMode.column,
              // child: SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: (context.tree as TableLayoutElement).toWidget(context),
              // ),
            ),
          );
        },
        "iframe": (RenderContext context, Widget child) {
          if (context.tree.element!.outerHtml.contains("bnd-video-player")) {
            final String src = context.tree.element!.attributes["src"] ?? "";
            return BNDVideoPlayer(url: src);
          }
          return child;
        },
        "img": (RenderContext context, Widget child) {
          final String src = context.tree.element!.attributes["src"] ?? "";
          if (src.isEmpty) return const SizedBox();
          if (widget.isCustomShowImage)
            return Container(
                margin: const EdgeInsets.only(bottom: 4), child: BNDImage(imageUrl: src, isShowLoading: false));
        },
        "audio": (RenderContext context, Widget child) {
          final String src = context.tree.element!.attributes["src"] ?? "";
          if (src.isEmpty) return const SizedBox();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: BndAudioPlayer(
              url: src,
              pauseStream: _pauseStreamController,
            ),
          );
        },
      },
      tagsList: Html.tags
        ..add('input')
        ..add('select'),
    );
  }

  Widget _buildMath(String content, double fontSize, int timeError) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Math.tex(
        content,
        textStyle: widget.textStyle ?? TextStyle(fontSize: fontSize),
        onErrorFallback: (FlutterMathException e) {
          if (e.message == "Unknown column alignment: *" && timeError < 2) {
            return _buildMath(content.replaceAll("*{20}", ""), fontSize, timeError++);
          } else
            return SingleChildScrollView(
              child: Text(content),
              scrollDirection: Axis.horizontal,
            );
        },
      ),
    );
  }

  Widget _buildInputSelect(RenderContext context, int index) {
    Tuple2<BoxDecoration, TextStyle>? styles;
    if (widget.fillAnswerStyles != null && widget.fillAnswerStyles!.length > index)
      styles = widget.fillAnswerStyles![index];

    final Container _widget = Container(
      decoration: styles?.item1,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(
        widget.pattern.replaceAll("{text}", (index + 1).toString()),
        style: styles?.item2,
      ),
    );

    return _widget;
  }
}
