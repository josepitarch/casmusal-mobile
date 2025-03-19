import 'package:el_castell_app/providers/schedule_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchForm extends StatefulWidget {
  final List<int> areas;
  final Function(int, String) callback;
  const SearchForm({required this.areas, required this.callback, super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  String? area;
  String? smallholding;

  @override
  void initState() {
    area = context.read<ScheduleProvider>().form['area'];
    smallholding = context.read<ScheduleProvider>().form['smallholding'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),

      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Seleccione su polígono",
                border: OutlineInputBorder(),
              ),
              value: area,
              items:
                  widget.areas.map((int item) {
                    return DropdownMenuItem<String>(
                      value: item.toString(),
                      child: Text('Polígono ${item.toString()}'),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  area = newValue;
                });
              },
              validator: (value) => value == null ? 'Seleccione un polígono' : null,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Escriba su parcela",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                smallholding = value;
              },
              initialValue: smallholding,
              keyboardType: TextInputType.number,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'El campo no puede estar vacío' : null,
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  widget.callback(int.parse(area!), smallholding!);
                }
              },

              child: Text("Buscar"),
            ),
          ],
        ),
      ),
    );
  }
}
