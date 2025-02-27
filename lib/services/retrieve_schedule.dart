import 'dart:convert';

import 'package:el_castell_app/models/schedule.dart';
import 'package:http/http.dart' as http;

Future<List<Schedule>> getSchedule() async {
  final response = await http.post(
    Uri.parse(
      'https://api.cloudflare.com/client/v4/accounts/689ec7b5186e9b02ee1d5a7b4c55711e/d1/database/86ce23dd-d071-4f0f-aed9-398f81dc13a6/query',
    ),
    headers: {'Authorization': 'Bearer mrtdATBU62vTD6aCyqsjsY5F2fHw3J3mNM5EH3wb'},
    body: jsonEncode({'sql': 'SELECT * FROM "schedule"'}),
  );
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body)['result'][0]['results'];
    return body.map((e) => Schedule.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load schedule');
  }
}
