import 'package:el_castell_app/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateFavouriteDialog extends StatelessWidget {
  const CreateFavouriteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return AlertDialog(
      title: Text('Ingrese un texto'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Escribe aquí...'),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
        TextButton(
          onPressed: () => Navigator.pop(context, {'title': controller.text}),
          child: Text('Aceptar'),
        ),
      ],
    );
  }
}
