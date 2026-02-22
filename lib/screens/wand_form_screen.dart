import 'dart:io';

import 'package:flutter/material.dart';
import '../models/wand.dart';
import '../services/wand_service.dart';

class WandFormScreen extends StatefulWidget{
  //Si agregamos, no tenemos varita (vacía); si editamos, tenemos varita a editar
  final Wand? wand;
  final VoidCallback onSaved; //Callback para refrescar la lista después de guardar

  const WandFormScreen({super.key, this.wand, required this.onSaved});

  @override
  State<StatefulWidget> createState() => _WandFormScreenState();
}

class _WandFormScreenState extends State<WandFormScreen>{
  final service = WandService();
  final coreCtrl = TextEditingController(); //Controlador para el campo core
  final woodCtrl = TextEditingController(); //Controlador para el campo wood
  final lengthCtrl = TextEditingController(); //Controlador para el campo length

  //Función que se ejecuta cuando se crea el widget
  //Si editamos (wand !=null), llenamos los campos con los datos que tenemos de la varita
  @override
  void initState() {
    super.initState();
    if (widget.wand != null) {
      coreCtrl.text = widget.wand?.core ?? '';
      woodCtrl.text = widget.wand?.wood ?? '';
      lengthCtrl.text = widget.wand?.length.toString() ?? '0'; 
      //Por haceer: dvertir al usuario si no es un número double
    }
  }


  @override
  Widget build(BuildContext context) {
    final isEdit = widget.wand != null;

    return Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? "Edit wand" : "Add new wand"),
        ),
        body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: coreCtrl,
                decoration: const InputDecoration(labelText: "Core"),
              ),
              TextField(
                controller: woodCtrl,
                decoration: const InputDecoration(labelText: "Wood"),
              ),
              TextField(
                controller: lengthCtrl,
                decoration: const InputDecoration(labelText: "Length"),
                keyboardType: Platform.isIOS ? const TextInputType.numberWithOptions(signed: false, decimal: true) : TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(isEdit ? "Update" : "Save"),
                onPressed: () async {
                  final length = double.tryParse(lengthCtrl.text) ?? 0.0;

                  if (isEdit) {
                    await service.updateWand(widget.wand!.id, coreCtrl.text, woodCtrl.text, length);
                  } else {
                    await service.addWand(coreCtrl.text, woodCtrl.text, length);
                  }
                  widget.onSaved(); //Refrescar la lista
                  Navigator.pop(context); //Volver a la pantalla anterior
                },

              )
            ],
          ),
        ),
    );
  }
}