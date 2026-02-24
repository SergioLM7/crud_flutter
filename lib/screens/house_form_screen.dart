import 'package:flutter/material.dart';
import 'package:hogwarts_with_flutter/services/house_service.dart';
import '../models/house.dart';

class HouseFormScreen extends StatefulWidget{
  //Si agregamos, no tenemos casa (vacía); si editamos, tenemos casa a editar
  final House? house;
  final VoidCallback onSaved; //Callback para refrescar la lista después de guardar

  const HouseFormScreen({super.key, this.house, required this.onSaved});

  @override
  State<StatefulWidget> createState() => _HouseFormScreenState();
}

class _HouseFormScreenState extends State<HouseFormScreen>{
  final service = HouseService();
  final nameCtrl = TextEditingController(); //Controlador para el campo name
  final founderCtrl = TextEditingController(); //Controlador para el campo founder

  //Función que se ejecuta cuando se crea el widget
  //Si editamos (house !=null), llenamos los campos con los datos que tenemos de la casa
  @override
  void initState() {
    super.initState();
    if (widget.house != null) {
      nameCtrl.text = widget.house?.name ?? '';
      founderCtrl.text = widget.house?.founder ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.house != null;
    final headerStyle = Theme.of(context).textTheme.headlineLarge;

    return Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? "Edit house" : "Add new house", style: headerStyle),
        ),
        body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "House name"),
              ),
              TextField(
                controller: founderCtrl,
                decoration: const InputDecoration(labelText: "House founder name"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(isEdit ? "Update" : "Save"),
                onPressed: () async {
                  if (isEdit) {
                    await service.updateHouse(widget.house!.id, nameCtrl.text, founderCtrl.text);
                  } else {
                    await service.addHouse(nameCtrl.text, founderCtrl.text);
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