final class Schedule {
  final int area;
  final dynamic smallHolding;
  final String society;
  final dynamic hg;
  final dynamic fireHydrant;
  final dynamic satudardaySector;
  final String saturdayStartTime;
  final String saturdayEndTime;
  final dynamic weekdaySector;
  final String weekdayStartTime01;
  final String weekdayEndTime01;
  final String weekdayStartTime02;
  final String weekdayEndTime02;

  Schedule({
    required this.area,
    required this.smallHolding,
    required this.society,
    required this.hg,
    required this.fireHydrant,
    required this.satudardaySector,
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
      smallHolding: json['smallholding'],
      society: json['society'],
      hg: json['hanegadas'],
      fireHydrant: json['fire_hydrant'],
      satudardaySector: json['sector'],
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
    return 'Schedule(area: $area, smallHolding: $smallHolding, society: $society, hg: $hg, fireHydrant: $fireHydrant, satudardaySector: $satudardaySector, saturdayStartTime: $saturdayStartTime, saturdayEndTime: $saturdayEndTime, weekdaySector: $weekdaySector, weekdayStartTime01: $weekdayStartTime01, weekdayEndTime01: $weekdayEndTime01, weekdayStartTime02: $weekdayStartTime02, weekdayEndTime02: $weekdayEndTime02)';
  }
}
