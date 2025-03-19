import 'package:el_castell_app/dialogs/create_favourite.dart';
import 'package:el_castell_app/models/schedule.dart';
import 'package:el_castell_app/providers/favourites_provider.dart';
import 'package:el_castell_app/providers/schedule_provider.dart';
import 'package:el_castell_app/widgets/info_card.dart';
import 'package:el_castell_app/widgets/search_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});
  @override
  ScheduleScreenState createState() => ScheduleScreenState();
}

class ScheduleScreenState extends State<ScheduleScreen> {
  Schedule? schedule;
  bool searched = false;

  @override
  void initState() {
    final form = context.read<ScheduleProvider>().form;
    if (form['area'] != null && form['smallholding'] != null) {
      schedule = context.read<ScheduleProvider>().getScheduleByAreaAndSmallHolding(
        int.parse(form['area']!),
        form['smallholding'],
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScheduleProvider>(context);
    final favouritesProvider = Provider.of<FavouritesProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    void updateState(int area, String smallholding) {
      setState(() {
        schedule = provider.getScheduleByAreaAndSmallHolding(area, smallholding);
        searched = true;
        provider.form['area'] = area.toString();
        provider.form['smallholding'] = smallholding;
      });
    }

    if (schedule == null && !searched) {
      return SafeArea(
        child: Column(
          spacing: 20,
          children: [SearchForm(areas: provider.getAllAreas(), callback: updateState)],
        ),
      );
    }

    if (schedule == null && searched) {
      return SafeArea(
        child: Column(
          spacing: 20,
          children: [
            SearchForm(areas: provider.getAllAreas(), callback: updateState),
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  'No se encontraron resultados',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      );
    }

    bool isFavourite = favouritesProvider.isFavourite(schedule!);

    return SafeArea(
      child: Column(
        spacing: 20,
        children: [
          SearchForm(areas: provider.getAllAreas(), callback: updateState),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 20,
                  children: [
                    InfoCard(schedule: schedule!),
                    if (!isFavourite)
                      ElevatedButton(
                        child: Text('Agregar a favoritos'),
                        onPressed:
                            () => showDialog(
                              context: context,
                              builder: (context) {
                                return CreateFavouriteDialog();
                              },
                            ).then((value) {
                              if (value['title'] != null) {
                                favouritesProvider.addFavourite(
                                  schedule!.area,
                                  schedule!.smallholding,
                                  value['title'],
                                );
                              }
                            }),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
