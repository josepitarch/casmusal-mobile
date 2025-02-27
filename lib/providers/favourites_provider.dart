import 'package:el_castell_app/database/favourites_repository.dart';
import 'package:el_castell_app/models/schedule.dart';
import 'package:flutter/foundation.dart';

final class FavouritesProvider extends ChangeNotifier {
  final List<dynamic> favourites = [];
  bool isLoading = false;

  FavouritesProvider() {
    isLoading = true;
    getFavourites().then((value) => favourites.addAll(value)).whenComplete(() => isLoading = false);
  }

  void addFavourite(int area, dynamic smallHolding, String name) async {
    await save(area, smallHolding, name);
    favourites.add({'area': area, 'smallholding': smallHolding, 'name': name});
    notifyListeners();
  }

  void deleteFavourite(int area, String smallHolding) async {
    await delete(area, smallHolding);
    favourites.removeWhere(
      (element) => element['area'] == area && element['smallholding'] == smallHolding,
    );
    notifyListeners();
  }

  isFavourite(Schedule schedule) {
    return favourites.any(
      (element) =>
          element['area'] == schedule.area.toString() &&
          element['smallholding'] == schedule.smallHolding.toString(),
    );
  }
}
