import 'package:el_castell_app/widgets/sector_title.dart';
import 'package:flutter/material.dart';

final class SaturdaySector extends StatelessWidget {
  final String saturdaySector;
  final String saturdayStartTime;
  final String saturdayEndTime;
  const SaturdaySector({
    required this.saturdaySector,
    required this.saturdayStartTime,
    required this.saturdayEndTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        SectorTitle(title: 'Sector Sábado: $saturdaySector'),
        Text(
          'Horario: $saturdayStartTime - $saturdayEndTime',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
