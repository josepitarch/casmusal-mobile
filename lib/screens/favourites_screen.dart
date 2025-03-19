import 'package:el_castell_app/models/schedule.dart';
import 'package:el_castell_app/providers/favourites_provider.dart';
import 'package:el_castell_app/providers/schedule_provider.dart';
import 'package:el_castell_app/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouritesProvider>(context);
    final providerSchedule = Provider.of<ScheduleProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    Future<void> showDeleteDialog(Schedule schedule) async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que deseas eliminar este elemento? Esta acción no se puede deshacer.',
            ),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancelar')),
              TextButton(
                onPressed: () {
                  provider.deleteFavourite(schedule.area, schedule.smallholding);
                  Navigator.of(context).pop();
                },
                child: Text('Eliminar', style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      );
    }

    onTap(Schedule schedule) => showModalBottomSheet(
      context: context,
      builder:
          (_) => FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: InfoCard(schedule: schedule),
          ),
    );

    if (provider.favourites.isEmpty) {
      return Center(
        child: Text('Todavía no tiene favoritos', style: Theme.of(context).textTheme.headlineSmall),
      );
    }

    return ListView.builder(
      itemCount: provider.favourites.length,
      itemBuilder: (context, index) {
        final Schedule? schedule = providerSchedule.getScheduleByAreaAndSmallHolding(
          int.parse(provider.favourites[index]['area']),
          provider.favourites[index]['smallholding'],
        );

        if (schedule == null) {
          return SizedBox.shrink();
        }

        return Container(
          color: index.isEven ? Colors.grey[200] : Colors.white,
          child: ListTile(
            title: Text(provider.favourites[index]['name'].toString().toUpperCase()),
            onLongPress: () => showDeleteDialog(schedule),
            onTap: () => onTap(schedule),
          ),
        );
      },
    );
  }
}
