import 'package:el_castell_app/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouritesProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      children:
          provider.favourites
              .map(
                (e) => ListTile(
                  title: Text(
                    e['name'].toString() +
                        ' ${e['area'].toString() + e['smallholding'].toString()}',
                  ),
                ),
              )
              .toList(),
    );
  }
}
