import 'package:el_castell_app/models/schedule.dart';
import 'package:el_castell_app/widgets/info_header.dart';
import 'package:el_castell_app/widgets/saturday_sector.dart';
import 'package:el_castell_app/widgets/weekday_sector.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Schedule schedule;
  const InfoCard({required this.schedule, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),

      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoHeader(text: 'Polígono ${schedule.area}', side: 'left'),
              InfoHeader(text: 'Parcela ${schedule.smallholding}', side: 'right'),
            ],
          ),
          Text(schedule.society, style: Theme.of(context).textTheme.headlineMedium),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                SaturdaySector(
                  saturdaySector: schedule.saturdaySector,
                  saturdayStartTime: schedule.saturdayStartTime,
                  saturdayEndTime: schedule.saturdayEndTime,
                ),
                Divider(height: 1),
                WeekdaySector(
                  weekdaySector: schedule.weekdaySector,
                  weekdayStartTime01: schedule.weekdayStartTime01,
                  weekdayEndTime01: schedule.weekdayEndTime01,
                  weekdayStartTime02: schedule.weekdayStartTime02,
                  weekdayEndTime02: schedule.weekdayEndTime02,
                ),
                Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (schedule.hg.isNotEmpty) Text('Hanegadas: ${schedule.hg}'),
                    if (schedule.fireHydrant.isNotEmpty)
                      Text('Bomba de fuego: ${schedule.fireHydrant}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
