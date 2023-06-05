import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class BookCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String rating;
  final Function()? onPressed;

  const BookCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.rating,
    required this.onPressed,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool _isPressed = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 210,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            image: DecorationImage(
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.cover,
            ),
            color: grey100Color,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff06070D).withOpacity(.12),
                offset: const Offset(0, 7),
                blurRadius: 14,
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          widget.author,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: grey500Color,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star_rounded, color: yellowColor, size: 20),
            const SizedBox(width: 2),
            Text(
              widget.rating,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.left,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    )
        .width(140)
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
