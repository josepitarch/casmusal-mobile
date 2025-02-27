import 'package:flutter/material.dart';

final class SectorTitle extends StatelessWidget {
  final String title;

  const SectorTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headlineSmall);
  }
}
