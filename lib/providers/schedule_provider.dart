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

  Schedule? getScheduleByAreaAndSmallHolding(String area, dynamic smallHolding) {
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

  List<String> getAllAreas() {
    final a = schedule.map((e) => e.area).toSet().toList();
    a.sort((a, b) {
      final aNumber = int.tryParse(a);
      final bNumber = int.tryParse(b);

      if (aNumber == null) return 1;
      if (bNumber == null) return 1;

      return aNumber.compareTo(bNumber);
    });

    return a;
  }

  Set<String> getAllSocietys() {
    return schedule.map((e) => e.society.toString()).toSet();
  }
}
