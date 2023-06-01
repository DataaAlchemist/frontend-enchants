import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../core/themes/theme.dart';

class EnchantChip extends StatefulWidget {
  final String label;
  final bool isActive;
  final bool enabled;
  final Function()? onPressed;

  const EnchantChip({
    super.key,
    required this.label,
    required this.onPressed,
    this.isActive = false,
    this.enabled = true,
  });

  @override
  State<EnchantChip> createState() => _EnchantChipState();
}

class _EnchantChipState extends State<EnchantChip> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.label,
      style: const TextStyle(fontWeight: FontWeight.w500),
    )
        .padding(horizontal: 24, vertical: 8)
        .decorated(
          color: widget.isActive ? red50Color : Colors.transparent,
          border: Border.all(width: 2, color: widget.isActive ? primaryColor : grey100Color),
          borderRadius: BorderRadius.circular(120),
        )
        .ripple()
        .gestures(onTap: widget.onPressed)
        .clipRRect(all: 120);
  }
}
