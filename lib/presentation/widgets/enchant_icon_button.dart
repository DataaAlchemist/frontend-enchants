import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../core/themes/theme.dart';

class EnchantIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Function()? onPressed;

  const EnchantIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color = grey700Color,
  });

  @override
  State<EnchantIconButton> createState() => _EnchantIconButtonState();
}

class _EnchantIconButtonState extends State<EnchantIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Icon(widget.icon, color: widget.color)
        .padding(all: 8)
        .ripple()
        .clipRRect(all: defaultBorderRadius)
        .decorated(
          color: Colors.white,
          border: Border.all(width: 1, color: grey100Color),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(.04),
            ),
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8,
              color: Colors.black.withOpacity(.06),
            )
          ],
        )
        .gestures(
          onTapChange: (tapStatus) => setState(() => _isPressed = tapStatus),
          onTap: widget.onPressed,
        )
        .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
        .animate(
          const Duration(milliseconds: 175),
          Curves.fastLinearToSlowEaseIn,
        );
  }
}
