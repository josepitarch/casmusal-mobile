import 'package:el_castell_app/models/schedule.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final Schedule schedule;
  const InfoScreen({required this.schedule, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(15.0), child: Text(schedule.toString()));
  }
}
