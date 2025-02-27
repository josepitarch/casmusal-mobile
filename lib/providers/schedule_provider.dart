import 'package:el_castell_app/models/schedule.dart';
import 'package:el_castell_app/services/retrieve_schedule.dart';
import 'package:flutter/material.dart';

final class ScheduleProvider extends ChangeNotifier {
  List<Schedule> schedule = [];
  bool isLoading = true;

  ScheduleProvider() {
    getSchedule().then((value) {
      schedule = value;
      isLoading = false;
      notifyListeners();
    });
  }
}
