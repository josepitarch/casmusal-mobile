import 'package:el_castell_app/database/favourites_repository.dart';
import 'package:el_castell_app/models/schedule.dart';
import 'package:el_castell_app/providers/favourites_provider.dart';
import 'package:el_castell_app/providers/schedule_provider.dart';
import 'package:el_castell_app/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScheduleProvider>(context);
    final providerFavourites = Provider.of<FavouritesProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    onTap(Schedule schedule) => showModalBottomSheet(
      context: context,
      builder:
          (_) => FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: InfoScreen(schedule: schedule),
          ),
    );

    void showInputDialog(Schedule schedule) {
      TextEditingController _controller = TextEditingController();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ingrese un texto'),
            content: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Escribe aquí...'),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
              TextButton(
                onPressed: () {
                  String inputText = _controller.text;
                  Navigator.pop(context, inputText);
                  providerFavourites.addFavourite(schedule.area, schedule.smallHolding, inputText);
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }

    return ListView(
      children:
          provider.schedule
              .map(
                (e) => ListTile(
                  title: Text('Polígono ${e.area.toString()}'),
                  subtitle: Text('Parcela ${e.smallHolding.toString()}'),
                  trailing: IconButton(
                    icon: Icon(
                      providerFavourites.isFavourite(e) ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => showInputDialog(e),
                  ),
                  onTap: () => onTap(e),
                ),
              )
              .toList(),
    );
  }
}
