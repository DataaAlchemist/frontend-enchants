import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class RoundedButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double verticalPadding;
  final double horizontalPadding;
  final bool enabled;
  final bool elevated;
  final Function()? onPressed;

  const RoundedButton({
    Key? key,
    required this.label,
    this.backgroundColor = primaryColor,
    this.textColor = Colors.white,
    this.verticalPadding = 12,
    this.horizontalPadding = 32,
    this.enabled = true,
    this.elevated = true,
    this.onPressed,
  }) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return Text(
        widget.label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: grey500Color,
          fontWeight: FontWeight.w600,
        ),
      )
          .padding(
            vertical: widget.verticalPadding,
            horizontal: widget.horizontalPadding,
          )
          .borderRadius(all: defaultBorderRadius)
          .backgroundColor(grey200Color)
          .clipRRect(all: defaultBorderRadius);
    }

    return Text(
      widget.label,
      textAlign: TextAlign.center,
      style: TextStyle(color: widget.textColor, fontWeight: FontWeight.w600),
    )
        .padding(
          vertical: widget.verticalPadding,
          horizontal: widget.horizontalPadding,
        )
        .borderRadius(all: defaultBorderRadius)
        .ripple()
        .backgroundColor(widget.backgroundColor, animate: true)
        .clipRRect(all: defaultBorderRadius)
        .borderRadius(all: defaultBorderRadius, animate: true)
        .gestures(
          onTapChange: (tapStatus) => setState(() => _isPressed = tapStatus),
          onTap: widget.onPressed,
        )
        .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
        .animate(
            const Duration(milliseconds: 175), Curves.fastLinearToSlowEaseIn);
  }
}
