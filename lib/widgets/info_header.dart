import 'package:flutter/material.dart';

final class InfoHeader extends StatelessWidget {
  final String text;
  final String side;
  const InfoHeader({required this.text, required this.side, super.key});

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius =
        side == 'left'
            ? BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
            : BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20));
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: borderRadius,
      ),
      child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}
