import 'package:el_castell_app/models/schedule.dart';
import 'package:el_castell_app/providers/favourites_provider.dart';
import 'package:el_castell_app/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;
  const ScheduleItem(this.schedule, {super.key});

  @override
  Widget build(BuildContext context) {
    final providerFavourites = Provider.of<FavouritesProvider>(context);

    showInfoDialog(Schedule schedule) => showModalBottomSheet(
      context: context,
      builder:
          (_) => FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: InfoCard(schedule: schedule),
          ),
    );

    void saveFavouriteDialog(Schedule schedule) {
      TextEditingController controller = TextEditingController();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('¿Cómo quieres guardarlo?'),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Escribe aquí...'),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
              TextButton(
                onPressed: () {
                  String inputText = controller.text;
                  Navigator.pop(context, inputText);
                  providerFavourites.addFavourite(schedule.area, schedule.smallholding, inputText);
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }

    return ListTile(
      title: Text(
        'Polígono ${schedule.area.toString()}',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text('Parcela ${schedule.smallholding.toString()}'),

      trailing: IconButton(
        icon: Icon(
          providerFavourites.isFavourite(schedule) ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed:
            () =>
                !providerFavourites.isFavourite(schedule)
                    ? saveFavouriteDialog(schedule)
                    : ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Este elemento ya está en tus favoritos"),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        animation: CurvedAnimation(
                          parent: ModalRoute.of(context)!.animation!,
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ),
      ),
      onTap: () => showInfoDialog(schedule),
    );
  }
}
