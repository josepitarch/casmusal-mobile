final class Schedule {
  final String area;
  final String smallholding;
  final String society;
  final String hg;
  final String fireHydrant;
  final String saturdaySector;
  final String saturdayStartTime;
  final String saturdayEndTime;
  final String weekdaySector;
  final String weekdayStartTime01;
  final String weekdayEndTime01;
  final String weekdayStartTime02;
  final String weekdayEndTime02;

  Schedule({
    required this.area,
    required this.smallholding,
    required this.society,
    required this.hg,
    required this.fireHydrant,
    required this.saturdaySector,
    required this.saturdayStartTime,
    required this.saturdayEndTime,
    required this.weekdaySector,
    required this.weekdayStartTime01,
    required this.weekdayEndTime01,
    required this.weekdayStartTime02,
    required this.weekdayEndTime02,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      area: json['area'],
      smallholding: json['smallholding'],
      society: json['society'],
      hg: json['hg'],
      fireHydrant: json['fire_hydrant'],
      saturdaySector: json['saturday_sector'],
      saturdayStartTime: json['saturday_start_time'],
      saturdayEndTime: json['saturday_end_time'],
      weekdaySector: json['weekday_sector'],
      weekdayStartTime01: json['weekday_start_time_1'],
      weekdayEndTime01: json['weekday_end_time_1'],
      weekdayStartTime02: json['weekday_start_time_2'],
      weekdayEndTime02: json['weekday_end_time_2'],
    );
  }

  @override
  String toString() {
    return 'Schedule(area: $area, smallHolding: $smallholding, society: $society, hg: $hg, fireHydrant: $fireHydrant, saturdaySector: $saturdaySector, saturdayStartTime: $saturdayStartTime, saturdayEndTime: $saturdayEndTime, weekdaySector: $weekdaySector, weekdayStartTime01: $weekdayStartTime01, weekdayEndTime01: $weekdayEndTime01, weekdayStartTime02: $weekdayStartTime02, weekdayEndTime02: $weekdayEndTime02)';
  }
}
