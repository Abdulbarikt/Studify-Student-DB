import 'package:flutter/material.dart';

class DividerRow extends StatelessWidget {
  final String title;
  const DividerRow({
    required this.title,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 2, child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ).copyWith(
                // color: AppColors.kPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
        const Expanded(flex: 2, child: Divider())
      ],
    );
  }
}