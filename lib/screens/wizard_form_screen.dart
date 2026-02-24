import 'dart:io';
import 'package:flutter/material.dart';
import '../models/wizard.dart';
import '../models/wand.dart';
import '../models/house.dart'; 
import '../services/wizard_service.dart';
import '../services/wand_service.dart';
import '../services/house_service.dart';

class WizardFormScreen extends StatefulWidget{
  //Si agregamos, no tenemos mago (vacío); si editamos, tenemos mago a editar
  final Wizard? wizard;
  final VoidCallback onSaved; //Callback para refrescar la lista después de guardar

  const WizardFormScreen({super.key, this.wizard, required this.onSaved});

  @override
  State<StatefulWidget> createState() => _WizardFormScreenState();
}

class _WizardFormScreenState extends State<WizardFormScreen>{
  final service = WizardService();
  final wandService = WandService();
  final houseService = HouseService();
  final nameCtrl = TextEditingController(); //Controlador para el campo name
  final ageCtrl = TextEditingController(); //Controlador para el campo age
  final houseNameCtrl = TextEditingController(); //Controlador para el campo house name
  final wandCoreCtrl = TextEditingController(); //Controlador para el campo wand core
  final wandWoodCtrl = TextEditingController(); //Controlador para el campo wand wood

  List<House> housesList = [];
  List<Wand> wandsList = [];

  //Variables para guardar la selección actual de los dropdowns
  String? selectedHouseId;
  String? selectedWandId;

  //Función que se ejecuta cuando se crea el widget
  //Si editamos (wand !=null), llenamos los campos con los datos que tenemos de la varita
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final houses = await houseService.getHouses();
    final wands = await wandService.getWands();

    if(widget.wizard !=null) {
      final w = widget.wizard!;
      nameCtrl.text = w.name;
      ageCtrl.text = w.age.toString();
      selectedHouseId = w.houseId;
      selectedWandId = w.wandId;
    }

    setState(() {
      housesList = houses;
      wandsList = wands;
    });
  }


  @override
  Widget build(BuildContext context) {
    final isEdit = widget.wizard != null;
    final headerStyle = Theme.of(context).textTheme.headlineLarge;

    // Tema local para dar formato tipo TextField a los DropdownMenu
    final dropdownTheme = Theme.of(context).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? "Edit wizard" : "Add new wizard", style: headerStyle),
        ),
        body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: ageCtrl,
                decoration: const InputDecoration(labelText: "Age (years)"),
                keyboardType: Platform.isIOS ? const TextInputType.numberWithOptions(signed: false, decimal: false) : TextInputType.number,
              ),
              const SizedBox(height: 24),
              Theme(
                data: dropdownTheme,
                child: DropdownMenu<String>(
                  initialSelection: selectedHouseId,
                  label: const Text("House", style: TextStyle(fontWeight: FontWeight.bold)),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
                  ),

                  dropdownMenuEntries: housesList
                    .map((h) =>
                      DropdownMenuEntry<String>(value: h.id, label: h.name))
                      .toList(),

                      onSelected: (value) =>
                          setState(() => selectedHouseId = value),
                  ),
              ),
              const SizedBox(height: 16),
              // VARITA — igual estilo
              Theme(
                data: dropdownTheme,
                child: DropdownMenu<String>(
                  initialSelection: selectedWandId,
                  label: const Text("Wand ", style: TextStyle(fontWeight: FontWeight.bold)),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
                  ),

                  dropdownMenuEntries: wandsList
                    .map((w) => DropdownMenuEntry<String>(
                          value: w.id,
                          label: "${w.wood} - ${w.core}",
                        ),
                    ).toList(),

                  onSelected: (value) =>
                      setState(() => selectedWandId = value),
                  ),
              ),

              const SizedBox(height: 40), // deja hueco para el botón fijo
              ElevatedButton(
                child: Text(isEdit ? "Update" : "Save"),
                onPressed: () async {
                  final age = int.tryParse(ageCtrl.text) ?? 0;

                  if (isEdit) {
                    await service.updateWizard(widget.wizard!.id, nameCtrl.text, age, selectedHouseId ?? '', selectedWandId ?? '');
                  } else {
                    await service.addWizard(nameCtrl.text, age, selectedHouseId ?? '', selectedWandId ?? '');
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