import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum FontType {
  notoSans,
}

class KRTextAnimated extends StatefulWidget {
  final Animation<double> progress;
  final double size;
  final Color? color;
  final double? strokeWidth;
  final FontType fontType;
  final String text;

  const KRTextAnimated(
      {Key? key,
      required this.progress,
      required this.size,
      this.color,
      this.strokeWidth,
      required this.fontType, required this.text})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => KRTextAnimatedState();
}

class KRTextAnimatedState extends State<KRTextAnimated>
    with SingleTickerProviderStateMixin {

  var myChildSize = Size.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    switch (widget.fontType) {
      case FontType.notoSans:
        return CustomPaint(
            foregroundPainter: AnimatedNotoSansKRPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth, widget.text),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
    }
  }
}

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}

class AnimatedNotoSansKRPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;
  final String text;

  AnimatedNotoSansKRPathPainter(this._animation, this._color, this.strokeWidth, this.text)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    switch(text){
      /// 가 ~ 하
      case "가":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㄱ_1", size, Path()));
      case "나":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㄴ_1", size, Path()));
      case "다":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㄷ_1", size, Path()));
      case "라":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㄹ_1", size, Path()));
      case "마":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅁ_1", size, Path()));
      case "바":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅂ_1", size, Path()));
      case "사":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅅ_1", size, Path()));
      case "아":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅇ_1", size, Path()));
      case "자":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅈ_1", size, Path()));
      case "차":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅊ_1", size, Path()));
      case "카":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅋ_1", size, Path()));
      case "타":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅌ_1", size, Path()));
      case "파":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅍ_1", size, Path()));
      case "하":
        return krWordPathTwoWord("ㅏ", size, krWordPathTwoWord("ㅎ_1", size, Path()));

      /// 갸 ~ 햐
      case "갸":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㄱ_1", size, Path()));
      case "냐":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㄴ_1", size, Path()));
      case "댜":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㄷ_1", size, Path()));
      case "랴":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㄹ_1", size, Path()));
      case "먀":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅁ_1", size, Path()));
      case "뱌":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅂ_1", size, Path()));
      case "샤":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅅ_1", size, Path()));
      case "야":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅇ_1", size, Path()));
      case "쟈":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅈ_1", size, Path()));
      case "챠":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅊ_1", size, Path()));
      case "캬":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅋ_1", size, Path()));
      case "탸":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅌ_1", size, Path()));
      case "퍄":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅍ_1", size, Path()));
      case "햐":
        return krWordPathTwoWord("ㅑ", size, krWordPathTwoWord("ㅎ_1", size, Path()));

    /// 거 ~ 허
      case "거":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㄱ_1", size, Path()));
      case "너":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㄴ_1", size, Path()));
      case "더":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㄷ_1", size, Path()));
      case "러":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㄹ_1", size, Path()));
      case "머":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅁ_1", size, Path()));
      case "버":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅂ_1", size, Path()));
      case "서":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅅ_1", size, Path()));
      case "어":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅇ_1", size, Path()));
      case "저":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅈ_1", size, Path()));
      case "처":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅊ_1", size, Path()));
      case "커":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅋ_1", size, Path()));
      case "터":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅌ_1", size, Path()));
      case "퍼":
        return krWordPathTwoWord("ㅓ_1", size, krWordPathTwoWord("ㅍ_1", size, Path()));
      case "허":
        return krWordPathTwoWord("ㅓ_2", size, krWordPathTwoWord("ㅎ_1", size, Path()));

      /// 겨 ~ 혀
      case "겨":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㄱ_1", size, Path()));
      case "녀":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㄴ_1", size, Path()));
      case "뎌":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㄷ_1", size, Path()));
      case "려":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㄹ_1", size, Path()));
      case "며":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅁ_1", size, Path()));
      case "벼":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅂ_1", size, Path()));
      case "셔":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅅ_1", size, Path()));
      case "여":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅇ_1", size, Path()));
      case "져":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅈ_1", size, Path()));
      case "쳐":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅊ_1", size, Path()));
      case "켜":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅋ_1", size, Path()));
      case "텨":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅌ_1", size, Path()));
      case "펴":
        return krWordPathTwoWord("ㅕ_1", size, krWordPathTwoWord("ㅍ_1", size, Path()));
      case "혀":
        return krWordPathTwoWord("ㅕ_2", size, krWordPathTwoWord("ㅎ_1", size, Path()));

      /// 고 ~ 호
      case "고":
        return krWordPathTwoWord("ㅗ_1", size, krWordPathTwoWord("ㄱ_2", size, Path()));
      case "노":
        return krWordPathTwoWord("ㅗ_2", size, krWordPathTwoWord("ㄴ_2", size, Path()));
      case "도":
        return krWordPathTwoWord("ㅗ_2", size, krWordPathTwoWord("ㄷ_2", size, Path()));
      case "로":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㄹ_2", size, Path()));
      case "모":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㅁ_2", size, Path()));
      case "보":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㅂ_2", size, Path()));
      case "소":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㅅ_2", size, Path()));
      case "오":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㅇ_2", size, Path()));
      case "조":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㅈ_2", size, Path()));
      case "초":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㅊ_2", size, Path()));
      case "코":
        return krWordPathTwoWord("ㅗ_1", size, krWordPathTwoWord("ㅋ_2", size, Path()));
      case "토":
        return krWordPathTwoWord("ㅗ_2", size, krWordPathTwoWord("ㅌ_2", size, Path()));
      case "포":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㅍ_2", size, Path()));
      case "호":
        return krWordPathTwoWord("ㅗ_3", size, krWordPathTwoWord("ㅎ_2", size, Path()));

      default:
        return Path();
    }


  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path krWordPathTwoWord(String text, Size size, Path path){
    switch(text){
      case "ㄱ_1":
        return Path()
          ..moveTo(0.11 * size.width, 0.145 * size.height)
          ..lineTo(0.51 * size.width, 0.145 * size.height)
          ..quadraticBezierTo(0.51 * size.width, 0.145 * size.height, 0.50 * size.width, 0.24 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.24 * size.height, 0.485 * size.width, 0.32 * size.height)
          ..quadraticBezierTo(0.485 * size.width, 0.32 * size.height, 0.45 * size.width, 0.41 * size.height)
          ..quadraticBezierTo(0.45 * size.width, 0.41 * size.height, 0.405 * size.width, 0.495 * size.height)
          ..quadraticBezierTo(0.405 * size.width, 0.495 * size.height, 0.345 * size.width, 0.575 * size.height)
          ..quadraticBezierTo(0.345 * size.width, 0.575 * size.height, 0.275 * size.width, 0.645 * size.height)
          ..quadraticBezierTo(0.275 * size.width, 0.645 * size.height, 0.195 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.195 * size.width, 0.705 * size.height, 0.11 * size.width, 0.76 * size.height);
      case "ㄴ_1":
        return Path()
          ..moveTo(0.13 * size.width, 0.12 * size.height)
          ..lineTo(0.13 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.13 * size.width, 0.705 * size.height, 0.25 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.25 * size.width, 0.705 * size.height, 0.375 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.70 * size.height, 0.50 * size.width, 0.685 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.685 * size.height, 0.615 * size.width, 0.665 * size.height);
      case "ㄷ_1":
        return Path()
          ..moveTo(0.53 * size.width, 0.135 * size.height)
          ..lineTo(0.135 * size.width, 0.135 * size.height)
          ..lineTo(0.135 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.135 * size.width, 0.71 * size.height, 0.375 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.71 * size.height, 0.495 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.495 * size.width, 0.70 * size.height, 0.605 * size.width, 0.68 * size.height);
      case "ㄹ_1":
        return Path()
          ..moveTo(0.105 * size.width, 0.13 * size.height)
          ..lineTo(0.49 * size.width, 0.13 * size.height)
          ..lineTo(0.49 * size.width, 0.415 * size.height)
          ..lineTo(0.135 * size.width, 0.415 * size.height)
          ..lineTo(0.135 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.135 * size.width, 0.71 * size.height, 0.375 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.71 * size.height, 0.495 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.495 * size.width, 0.70 * size.height, 0.605 * size.width, 0.68 * size.height);
      case "ㅁ_1":
        return Path()
          ..moveTo(0.13 * size.width, 0.135 * size.height)
          ..lineTo(0.13 * size.width, 0.71 * size.height)
          ..moveTo(0.13 * size.width, 0.135 * size.height)
          ..lineTo(0.50 * size.width, 0.135 * size.height)
          ..lineTo(0.50 * size.width, 0.71 * size.height)
          ..moveTo(0.13 * size.width, 0.71 * size.height)
          ..lineTo(0.50 * size.width, 0.71 * size.height);
      case "ㅂ_1":
        return Path()
          ..moveTo(0.13 * size.width, 0.11 * size.height)
          ..lineTo(0.13 * size.width, 0.72 * size.height)
          ..moveTo(0.51 * size.width, 0.11 * size.height)
          ..lineTo(0.51 * size.width, 0.72 * size.height)
          ..moveTo(0.13 * size.width, 0.38 * size.height)
          ..lineTo(0.51 * size.width, 0.38 * size.height)
          ..moveTo(0.13 * size.width, 0.72 * size.height)
          ..lineTo(0.51 * size.width, 0.72 * size.height);
      case "ㅅ_1":
        return Path()
          ..moveTo(0.34 * size.width, 0.11 * size.height)
          ..lineTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.285 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.285 * size.width, 0.485 * size.height, 0.235 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.235 * size.width, 0.585 * size.height, 0.16 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.16 * size.width, 0.67 * size.height, 0.08 * size.width, 0.74 * size.height)
          ..moveTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.395 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.485 * size.height, 0.45 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.45 * size.width, 0.585 * size.height, 0.525 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.525 * size.width, 0.67 * size.height, 0.59 * size.width, 0.72 * size.height);
      case "ㅇ_1":
        return Path()
          ..moveTo(0.31 * size.width, 0.12 * size.height)
          ..quadraticBezierTo(0.31 * size.width, 0.12 * size.height, 0.21 * size.width, 0.15 * size.height)
          ..quadraticBezierTo(0.21 * size.width, 0.15 * size.height, 0.15 * size.width, 0.23 * size.height)
          ..quadraticBezierTo(0.15 * size.width, 0.23 * size.height, 0.115 * size.width, 0.335 * size.height)
          ..quadraticBezierTo(0.115 * size.width, 0.335 * size.height, 0.105 * size.width, 0.435 * size.height)
          ..quadraticBezierTo(0.105 * size.width, 0.435 * size.height, 0.115 * size.width, 0.53 * size.height)
          ..quadraticBezierTo(0.115 * size.width, 0.53 * size.height, 0.15 * size.width, 0.62 * size.height)
          ..quadraticBezierTo(0.15 * size.width, 0.62 * size.height, 0.21 * size.width, 0.695 * size.height)
          ..quadraticBezierTo(0.21 * size.width, 0.695 * size.height, 0.31 * size.width, 0.73 * size.height)
          ..quadraticBezierTo(0.31 * size.width, 0.73 * size.height, 0.41 * size.width, 0.695 * size.height)
          ..quadraticBezierTo(0.41 * size.width, 0.695 * size.height, 0.48 * size.width, 0.62 * size.height)
          ..quadraticBezierTo(0.48 * size.width, 0.62 * size.height, 0.51 * size.width, 0.525 * size.height)
          ..quadraticBezierTo(0.51 * size.width, 0.525 * size.height, 0.52 * size.width, 0.435 * size.height)
          ..quadraticBezierTo(0.52 * size.width, 0.435 * size.height, 0.51 * size.width, 0.335 * size.height)
          ..quadraticBezierTo(0.51 * size.width, 0.335 * size.height, 0.48 * size.width, 0.23 * size.height)
          ..quadraticBezierTo(0.48 * size.width, 0.23 * size.height, 0.41 * size.width, 0.15 * size.height)
          ..quadraticBezierTo(0.41 * size.width, 0.15 * size.height, 0.31 * size.width, 0.12 * size.height);
      case "ㅈ_1":
        return Path()
          ..moveTo(0.09 * size.width, 0.14 * size.height)
          ..lineTo(0.58 * size.width, 0.14 * size.height)
          ..moveTo(0.34 * size.width, 0.14 * size.height)
          ..lineTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.285 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.285 * size.width, 0.485 * size.height, 0.235 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.235 * size.width, 0.585 * size.height, 0.16 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.16 * size.width, 0.67 * size.height, 0.08 * size.width, 0.74 * size.height)
          ..moveTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.395 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.485 * size.height, 0.45 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.45 * size.width, 0.585 * size.height, 0.525 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.525 * size.width, 0.67 * size.height, 0.59 * size.width, 0.72 * size.height);
      case "ㅊ_1":
        return Path()
          ..moveTo(0.34 * size.width, 0.10 * size.height)
          ..lineTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.285 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.285 * size.width, 0.485 * size.height, 0.235 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.235 * size.width, 0.585 * size.height, 0.16 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.16 * size.width, 0.67 * size.height, 0.08 * size.width, 0.74 * size.height)
          ..moveTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.395 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.485 * size.height, 0.45 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.45 * size.width, 0.585 * size.height, 0.525 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.525 * size.width, 0.67 * size.height, 0.59 * size.width, 0.72 * size.height)
          ..moveTo(0.09 * size.width, 0.21 * size.height)
          ..lineTo(0.58 * size.width, 0.21 * size.height);
      case "ㅋ_1":
        return Path()
          ..moveTo(0.13 * size.width, 0.14 * size.height)
          ..lineTo(0.52 * size.width, 0.14 * size.height)
          ..quadraticBezierTo(0.52 * size.width, 0.14 * size.height, 0.515 * size.width, 0.195 * size.height)
          ..quadraticBezierTo(0.515 * size.width, 0.195 * size.height, 0.51 * size.width, 0.2475 * size.height)
          ..quadraticBezierTo(0.51 * size.width, 0.2475 * size.height, 0.50 * size.width, 0.30 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.30 * size.height, 0.485 * size.width, 0.355 * size.height)
          ..quadraticBezierTo(0.485 * size.width, 0.355 * size.height, 0.475 * size.width, 0.385 * size.height)
          ..quadraticBezierTo(0.475 * size.width, 0.385 * size.height, 0.445 * size.width, 0.455 * size.height)
          ..quadraticBezierTo(0.445 * size.width, 0.455 * size.height, 0.395 * size.width, 0.545 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.545 * size.height, 0.335 * size.width, 0.615 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.615 * size.height, 0.265 * size.width, 0.685 * size.height)
          ..quadraticBezierTo(0.265 * size.width, 0.685 * size.height, 0.18 * size.width, 0.74 * size.height)
          ..quadraticBezierTo(0.18 * size.width, 0.74 * size.height, 0.105 * size.width, 0.785 * size.height)
          ..moveTo(0.475 * size.width, 0.385 * size.height)
          ..lineTo(0.095 * size.width, 0.415 * size.height);
      case "ㅌ_1":
        return Path()
          ..moveTo(0.53 * size.width, 0.135 * size.height)
          ..lineTo(0.135 * size.width, 0.135 * size.height)
          ..lineTo(0.135 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.135 * size.width, 0.71 * size.height, 0.375 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.71 * size.height, 0.495 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.495 * size.width, 0.70 * size.height, 0.605 * size.width, 0.68 * size.height)
          ..moveTo(0.135 * size.width, 0.405 * size.height)
          ..lineTo(0.515 * size.width, 0.405 * size.height);
      case "ㅍ_1":
        return Path()
          ..moveTo(0.075 * size.width, 0.145 * size.height)
          ..lineTo(0.595 * size.width, 0.145 * size.height)
          ..moveTo(0.215 * size.width, 0.145 * size.height)
          ..lineTo(0.215 * size.width, 0.705 * size.height)
          ..moveTo(0.465 * size.width, 0.145 * size.height)
          ..lineTo(0.465 * size.width, 0.700 * size.height)
          ..moveTo(0.055 * size.width, 0.715 * size.height)
          ..quadraticBezierTo(0.055 * size.width, 0.715 * size.height, 0.205 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.205 * size.width, 0.71 * size.height, 0.35 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.35 * size.width, 0.705 * size.height, 0.50 * size.width, 0.695 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.695 * size.height, 0.65 * size.width, 0.68 * size.height);
      case "ㅎ_1":
        return Path()
          ..moveTo(0.06 * size.width, 0.195 * size.height)
          ..lineTo(0.615 * size.width, 0.195 * size.height)
          ..moveTo(0.34 * size.width, 0.03 * size.height)
          ..lineTo(0.34 * size.width, 0.195 * size.height)
          ..addOval(Rect.fromCircle(
            center: Offset(0.34 * size.width, 0.545 * size.height),
            radius: 0.2 * size.width,
          ));
      case "ㄱ_2":
        return Path()
          ..moveTo(0.16 * size.width, 0.14 * size.height)
          ..lineTo(0.795 * size.width, 0.14 * size.height)
          ..quadraticBezierTo(0.795 * size.width, 0.14 * size.height, 0.795 * size.width, 0.265 * size.height)
          ..quadraticBezierTo(0.795 * size.width, 0.265 * size.height, 0.79 * size.width, 0.39 * size.height)
          ..quadraticBezierTo(0.79 * size.width, 0.39 * size.height, 0.785 * size.width, 0.455 * size.height)
          ..quadraticBezierTo(0.785 * size.width, 0.455 * size.height, 0.78 * size.width, 0.515 * size.height)
          ..quadraticBezierTo(0.78 * size.width, 0.515 * size.height, 0.76 * size.width, 0.64 * size.height);
      case "ㄴ_2":
        return Path()
          ..moveTo(0.205 * size.width, 0.095 * size.height)
          ..lineTo(0.205 * size.width, 0.49 * size.height)
          ..lineTo(0.835 * size.width, 0.49 * size.height);
      case "ㄷ_2":
        return Path()
          ..moveTo(0.82 * size.width, 0.12 * size.height)
          ..lineTo(0.21 * size.width, 0.12 * size.height)
          ..lineTo(0.21 * size.width, 0.505 * size.height)
          ..lineTo(0.835 * size.width, 0.505 * size.height);
      case "ㄹ_2":
        return Path()
          ..moveTo(0.17 * size.width, 0.11 * size.height)
          ..lineTo(0.795 * size.width, 0.11 * size.height)
          ..lineTo(0.795 * size.width, 0.34 * size.height)
          ..lineTo(0.205 * size.width, 0.34 * size.height)
          ..lineTo(0.205 * size.width, 0.575 * size.height)
          ..lineTo(0.845 * size.width, 0.575 * size.height);
      case "ㅁ_2":
        return Path()
          ..moveTo(0.195 * size.width, 0.12 * size.height)
          ..lineTo(0.195 * size.width, 0.515 * size.height)
          ..moveTo(0.195 * size.width, 0.12 * size.height)
          ..lineTo(0.80 * size.width, 0.12 * size.height)
          ..lineTo(0.80 * size.width, 0.515 * size.height)
          ..moveTo(0.195 * size.width, 0.515 * size.height)
          ..lineTo(0.80 * size.width, 0.515 * size.height);
      case "ㅂ_2":
        return Path()
          ..moveTo(0.20 * size.width, 0.09 * size.height)
          ..lineTo(0.20 * size.width, 0.54 * size.height)
          ..moveTo(0.795 * size.width, 0.09 * size.height)
          ..lineTo(0.795 * size.width, 0.54 * size.height)
          ..moveTo(0.20 * size.width, 0.285 * size.height)
          ..lineTo(0.795 * size.width, 0.285 * size.height)
          ..moveTo(0.20 * size.width, 0.54 * size.height)
          ..lineTo(0.795 * size.width, 0.54 * size.height);
      case "ㅅ_2":
        return Path()
          ..moveTo(0.5 * size.width, 0.085 * size.height)
          ..lineTo(0.5 * size.width, 0.24 * size.height)
          ..quadraticBezierTo(0.5 * size.width, 0.24 * size.height, 0.44 * size.width, 0.30 * size.height)
          ..quadraticBezierTo(0.44 * size.width, 0.30 * size.height, 0.39 * size.width, 0.37 * size.height)
          ..quadraticBezierTo(0.39 * size.width, 0.37 * size.height, 0.27 * size.width, 0.46 * size.height)
          ..quadraticBezierTo(0.27 * size.width, 0.46 * size.height, 0.13 * size.width, 0.52 * size.height)
          ..moveTo(0.5 * size.width, 0.24 * size.height)
          ..quadraticBezierTo(0.5 * size.width, 0.24 * size.height, 0.56 * size.width, 0.30 * size.height)
          ..quadraticBezierTo(0.56 * size.width, 0.30 * size.height, 0.61 * size.width, 0.37 * size.height)
          ..quadraticBezierTo(0.61 * size.width, 0.37 * size.height, 0.69 * size.width, 0.46 * size.height)
          ..quadraticBezierTo(0.69 * size.width, 0.46 * size.height, 0.83 * size.width, 0.52 * size.height);
      case "ㅇ_2":
        return Path()
          ..moveTo(0.5 * size.width, 0.10 * size.height)
          ..quadraticBezierTo(0.5 * size.width, 0.10 * size.height, 0.395 * size.width, 0.115 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.115 * size.height, 0.30 * size.width, 0.15 * size.height)
          ..quadraticBezierTo(0.30 * size.width, 0.15 * size.height, 0.22 * size.width, 0.22 * size.height)
          ..quadraticBezierTo(0.22 * size.width, 0.22 * size.height, 0.18 * size.width, 0.33 * size.height)
          ..quadraticBezierTo(0.18 * size.width, 0.33 * size.height, 0.22 * size.width, 0.44 * size.height)
          ..quadraticBezierTo(0.22 * size.width, 0.44 * size.height, 0.30 * size.width, 0.51 * size.height)
          ..quadraticBezierTo(0.30 * size.width, 0.51 * size.height, 0.40 * size.width, 0.54 * size.height)
          ..quadraticBezierTo(0.40 * size.width, 0.54 * size.height, 0.50 * size.width, 0.56 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.56 * size.height, 0.61 * size.width, 0.54 * size.height)
          ..quadraticBezierTo(0.61 * size.width, 0.54 * size.height, 0.71 * size.width, 0.50 * size.height)
          ..quadraticBezierTo(0.71 * size.width, 0.50 * size.height, 0.785 * size.width, 0.425 * size.height)
          ..quadraticBezierTo(0.785 * size.width, 0.425 * size.height, 0.82 * size.width, 0.33 * size.height)
          ..quadraticBezierTo(0.82 * size.width, 0.33 * size.height, 0.785 * size.width, 0.225 * size.height)
          ..quadraticBezierTo(0.785 * size.width, 0.225 * size.height, 0.70 * size.width, 0.15 * size.height)
          ..quadraticBezierTo(0.70 * size.width, 0.15 * size.height, 0.605 * size.width, 0.115 * size.height)
          ..quadraticBezierTo(0.605 * size.width, 0.115 * size.height, 0.5 * size.width, 0.10 * size.height);
      case "ㅈ_2":
        return Path()
          ..moveTo(0.14 * size.width, 0.13 * size.height)
          ..lineTo(0.86 * size.width, 0.13 * size.height)
          ..moveTo(0.5 * size.width, 0.13 * size.height)
          ..lineTo(0.5 * size.width, 0.24 * size.height)
          ..quadraticBezierTo(0.5 * size.width, 0.24 * size.height, 0.44 * size.width, 0.30 * size.height)
          ..quadraticBezierTo(0.44 * size.width, 0.30 * size.height, 0.39 * size.width, 0.37 * size.height)
          ..quadraticBezierTo(0.39 * size.width, 0.37 * size.height, 0.27 * size.width, 0.46 * size.height)
          ..quadraticBezierTo(0.27 * size.width, 0.46 * size.height, 0.13 * size.width, 0.52 * size.height)
          ..moveTo(0.5 * size.width, 0.24 * size.height)
          ..quadraticBezierTo(0.5 * size.width, 0.24 * size.height, 0.56 * size.width, 0.30 * size.height)
          ..quadraticBezierTo(0.56 * size.width, 0.30 * size.height, 0.61 * size.width, 0.37 * size.height)
          ..quadraticBezierTo(0.61 * size.width, 0.37 * size.height, 0.69 * size.width, 0.46 * size.height)
          ..quadraticBezierTo(0.69 * size.width, 0.46 * size.height, 0.83 * size.width, 0.52 * size.height);
      case "ㅊ_2":
        return Path()
          ..moveTo(0.14 * size.width, 0.17 * size.height)
          ..lineTo(0.86 * size.width, 0.17 * size.height)
          ..moveTo(0.5 * size.width, 0.02 * size.height)
          ..lineTo(0.5 * size.width, 0.24 * size.height)
          ..quadraticBezierTo(0.5 * size.width, 0.24 * size.height, 0.44 * size.width, 0.30 * size.height)
          ..quadraticBezierTo(0.44 * size.width, 0.30 * size.height, 0.39 * size.width, 0.37 * size.height)
          ..quadraticBezierTo(0.39 * size.width, 0.37 * size.height, 0.27 * size.width, 0.46 * size.height)
          ..quadraticBezierTo(0.27 * size.width, 0.46 * size.height, 0.13 * size.width, 0.52 * size.height)
          ..moveTo(0.5 * size.width, 0.24 * size.height)
          ..quadraticBezierTo(0.5 * size.width, 0.24 * size.height, 0.56 * size.width, 0.30 * size.height)
          ..quadraticBezierTo(0.56 * size.width, 0.30 * size.height, 0.61 * size.width, 0.37 * size.height)
          ..quadraticBezierTo(0.61 * size.width, 0.37 * size.height, 0.69 * size.width, 0.46 * size.height)
          ..quadraticBezierTo(0.69 * size.width, 0.46 * size.height, 0.83 * size.width, 0.52 * size.height);
      case "ㅋ_2":
        return Path()
          ..moveTo(0.16 * size.width, 0.14 * size.height)
          ..lineTo(0.795 * size.width, 0.14 * size.height)
          ..quadraticBezierTo(0.795 * size.width, 0.14 * size.height, 0.795 * size.width, 0.265 * size.height)
          ..quadraticBezierTo(0.795 * size.width, 0.265 * size.height, 0.79 * size.width, 0.39 * size.height)
          ..quadraticBezierTo(0.79 * size.width, 0.39 * size.height, 0.785 * size.width, 0.455 * size.height)
          ..quadraticBezierTo(0.785 * size.width, 0.455 * size.height, 0.78 * size.width, 0.515 * size.height)
          ..quadraticBezierTo(0.78 * size.width, 0.515 * size.height, 0.76 * size.width, 0.64 * size.height)
          ..moveTo(0.16 * size.width, 0.37 * size.height)
          ..lineTo(0.79 * size.width, 0.34 * size.height);
      case "ㅌ_2":
        return Path()
          ..moveTo(0.82 * size.width, 0.12 * size.height)
          ..lineTo(0.21 * size.width, 0.12 * size.height)
          ..lineTo(0.21 * size.width, 0.505 * size.height)
          ..lineTo(0.835 * size.width, 0.505 * size.height)
          ..moveTo(0.21 * size.width, 0.30 * size.height)
          ..lineTo(0.80 * size.width, 0.30 * size.height);
      case "ㅍ_2":
        return Path()
          ..moveTo(0.15 * size.width, 0.136 * size.height)
          ..lineTo(0.82 * size.width, 0.135 * size.height)
          ..moveTo(0.33 * size.width, 0.135 * size.height)
          ..lineTo(0.33 * size.width, 0.535 * size.height)
          ..moveTo(0.665 * size.width, 0.135 * size.height)
          ..lineTo(0.665 * size.width, 0.535 * size.height)
          ..moveTo(0.15 * size.width, 0.535 * size.height)
          ..lineTo(0.82 * size.width, 0.535 * size.height);
      case "ㅎ_2":
        return Path()
          ..moveTo(0.5 * size.width, 0.03 * size.height)
          ..lineTo(0.5 * size.width, 0.185 * size.height)
          ..moveTo(0.105 * size.width, 0.185 * size.height)
          ..lineTo(0.895 * size.width, 0.185 * size.height)
          ..moveTo(0.50 * size.width, 0.325 * size.height)
          ..quadraticBezierTo(0.5 * size.width, 0.325 * size.height, 0.405 * size.width, 0.335 * size.height)
          ..quadraticBezierTo(0.405 * size.width, 0.335 * size.height, 0.315 * size.width, 0.355 * size.height)
          ..quadraticBezierTo(0.315 * size.width, 0.355 * size.height, 0.25 * size.width, 0.40 * size.height)
          ..quadraticBezierTo(0.25 * size.width, 0.40 * size.height, 0.22 * size.width, 0.475 * size.height)
          ..quadraticBezierTo(0.22 * size.width, 0.475 * size.height, 0.25 * size.width, 0.56 * size.height)
          ..quadraticBezierTo(0.25 * size.width, 0.56 * size.height, 0.315 * size.width, 0.6 * size.height)
          ..quadraticBezierTo(0.315 * size.width, 0.6 * size.height, 0.405 * size.width, 0.625 * size.height)
          ..quadraticBezierTo(0.405 * size.width, 0.625 * size.height, 0.50 * size.width, 0.63 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.63 * size.height, 0.595 * size.width, 0.62 * size.height)
          ..quadraticBezierTo(0.595 * size.width, 0.62 * size.height, 0.685 * size.width, 0.60 * size.height)
          ..quadraticBezierTo(0.685 * size.width, 0.60 * size.height, 0.75 * size.width, 0.55 * size.height)
          ..quadraticBezierTo(0.75 * size.width, 0.55 * size.height, 0.775 * size.width, 0.475 * size.height)
          ..quadraticBezierTo(0.775 * size.width, 0.475 * size.height, 0.74 * size.width, 0.40 * size.height)
          ..quadraticBezierTo(0.74 * size.width, 0.40 * size.height, 0.685 * size.width, 0.335 * size.height)
          ..quadraticBezierTo(0.685 * size.width, 0.335 * size.height, 0.60 * size.width, 0.33 * size.height)
          ..quadraticBezierTo(0.60 * size.width, 0.33 * size.height, 0.5 * size.width, 0.325 * size.height);
      case "ㅏ":
        return path
          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "ㅑ":
        return path
          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.295 * size.height)
          ..lineTo(0.95 * size.width, 0.295 * size.height)
          ..moveTo(0.77 * size.width, 0.595 * size.height)
          ..lineTo(0.95 * size.width, 0.595 * size.height);
      case "ㅓ_1":
        return path
          ..moveTo(0.570 * size.width, 0.42 * size.height)
          ..lineTo(0.82 * size.width, 0.42 * size.height)
          ..moveTo(0.82 * size.width, 0.02 * size.height)
          ..lineTo(0.82 * size.width, 0.98 * size.height);
      case "ㅓ_2":
        return path
          ..moveTo(0.63 * size.width, 0.42 * size.height)
          ..lineTo(0.82 * size.width, 0.42 * size.height)
          ..moveTo(0.82 * size.width, 0.02 * size.height)
          ..lineTo(0.82 * size.width, 0.98 * size.height);
      case "ㅕ_1":
        return path
          ..moveTo(0.59 * size.width, 0.28 * size.height)
          ..lineTo(0.825 * size.width, 0.28 * size.height)
          ..moveTo(0.59 * size.width, 0.53 * size.height)
          ..lineTo(0.83 * size.width, 0.53 * size.height)
          ..moveTo(0.82 * size.width, 0.02 * size.height)
          ..lineTo(0.82 * size.width, 0.98 * size.height);
      case "ㅕ_2":
        return path
          ..moveTo(0.63 * size.width, 0.37 * size.height)
          ..lineTo(0.83 * size.width, 0.37 * size.height)
          ..moveTo(0.63 * size.width, 0.62 * size.height)
          ..lineTo(0.83 * size.width, 0.62 * size.height)
          ..moveTo(0.82 * size.width, 0.02 * size.height)
          ..lineTo(0.82 * size.width, 0.98 * size.height);
      case "ㅗ_1":
        return path
          ..moveTo(0.445 * size.width, 0.47 * size.height)
          ..lineTo(0.445 * size.width, 0.82 * size.height)
          ..moveTo(0.065 * size.width, 0.82 * size.height)
          ..lineTo(0.935 * size.width, 0.82 * size.height);
      case "ㅗ_2":
        return path
          ..moveTo(0.50 * size.width, 0.47 * size.height)
          ..lineTo(0.50 * size.width, 0.82 * size.height)
          ..moveTo(0.065 * size.width, 0.82 * size.height)
          ..lineTo(0.935 * size.width, 0.82 * size.height);
      case "ㅗ_3":
        return path
          ..moveTo(0.50 * size.width, 0.59 * size.height)
          ..lineTo(0.50 * size.width, 0.82 * size.height)
          ..moveTo(0.065 * size.width, 0.82 * size.height)
          ..lineTo(0.935 * size.width, 0.82 * size.height);

      default:
        return Path();
    }
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.06;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
