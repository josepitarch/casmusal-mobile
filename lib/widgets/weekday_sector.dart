import 'package:el_castell_app/widgets/sector_title.dart';
import 'package:flutter/material.dart';

final class WeekdaySector extends StatelessWidget {
  final int weekdaySector;
  final String weekdayStartTime01;
  final String weekdayEndTime01;
  final String weekdayStartTime02;
  final String weekdayEndTime02;
  const WeekdaySector({
    required this.weekdaySector,
    required this.weekdayStartTime01,
    required this.weekdayEndTime01,
    required this.weekdayStartTime02,
    required this.weekdayEndTime02,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectorTitle(title: 'Sector Semanal: $weekdaySector'),
        Text('Horario 1: $weekdayStartTime01 - $weekdayEndTime01'),
        Text('Horario 2: $weekdayStartTime02 - $weekdayEndTime02'),
      ],
    );
  }
}
