import 'package:el_castell_app/database/database_initializer.dart';

Future<bool> save(int area, String smallHolding, String name) async {
  final database = await DatabaseInitializer.instance.database;

  return database
      .insert('favourites', {'area': area, 'smallHolding': smallHolding, 'name': name})
      .then((value) => value > 0);
}

Future<List<Map<String, dynamic>>> getFavourites() async {
  final database = await DatabaseInitializer.instance.database;

  return database.query('favourites');
}

Future<bool> delete(int area, String smallHolding) async {
  final database = await DatabaseInitializer.instance.database;

  return database
      .delete('favourites', where: 'area = ? AND smallHolding = ?', whereArgs: [area, smallHolding])
      .then((value) => value > 0);
}
