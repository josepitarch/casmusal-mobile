import 'package:el_castell_app/providers/schedule_provider.dart';
import 'package:el_castell_app/widgets/schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate()
    : super(searchFieldLabel: "Introduzca una parcela", keyboardType: TextInputType.number);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final schedule = Provider.of<ScheduleProvider>(context).schedule;
    final results =
        schedule
            .where((item) => item.smallholding.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].smallholding),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return SizedBox.shrink();
    }
    final schedule = Provider.of<ScheduleProvider>(context).schedule;
    final suggestions =
        schedule
            .where((item) => item.smallholding.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView(children: suggestions.map((e) => ScheduleItem(e)).toList());
  }
}
