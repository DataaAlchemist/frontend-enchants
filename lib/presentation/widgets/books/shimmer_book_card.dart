import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/themes/theme.dart';

class ShimmerBookCard extends StatelessWidget {
  const ShimmerBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: grey100Color,
          highlightColor: Colors.white,
          child: Container(
            height: 210,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              color: grey100Color,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Shimmer.fromColors(
          baseColor: grey100Color,
          highlightColor: Colors.white,
          child: Container(
            height: 16,
            width: 80,
            color: grey100Color,
          ),
        ),
        const SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: grey100Color,
          highlightColor: Colors.white,
          child: Container(
            height: 12,
            width: 60,
            color: grey100Color,
          ),
        ),
      ],
    );
  }
}
