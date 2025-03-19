import 'package:el_castell_app/models/schedule.dart';
import 'package:el_castell_app/services/retrieve_schedule.dart';
import 'package:flutter/material.dart';

final class ScheduleProvider extends ChangeNotifier {
  String? area;
  String? smallholding;
  List<Schedule> schedule = [];
  bool isLoading = true;
  Map<String, String> form = {};

  ScheduleProvider() {
    getSchedule().then((value) {
      schedule = value;
      isLoading = false;
      notifyListeners();
    });
  }

  onRefresh() {
    schedule = [];
    isLoading = true;
    notifyListeners();
    getSchedule().then((value) {
      schedule = value;
      isLoading = false;
      notifyListeners();
    });
  }

  Schedule? getScheduleByAreaAndSmallHolding(int area, dynamic smallHolding) {
    try {
      return schedule.firstWhere(
        (element) =>
            element.area.toString() == area.toString() &&
            element.smallholding.toString() == smallHolding.toString(),
      );
    } on StateError {
      return null;
    }
  }

  List<int> getAllAreas() {
    return schedule.map((e) => int.parse(e.area.toString())).toSet().toList()..sort();
  }

  Set<String> getAllSocietys() {
    return schedule.map((e) => e.society.toString()).toSet();
  }
}
