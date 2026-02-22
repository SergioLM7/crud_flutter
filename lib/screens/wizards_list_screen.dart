import 'package:flutter/material.dart';
import '../services/wizard_service.dart';
import '../models/wizard.dart';
import '../screens/wizard_form_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WizardsListScreen extends StatefulWidget {
  const WizardsListScreen({super.key});
  
  @override
  State<StatefulWidget> createState() => _WizardsListScreenState();
}

class _WizardsListScreenState extends State<WizardsListScreen> {
  final service = WizardService();

  late Future<List<Wizard>> futureWizards;

  @override
  void initState() {
    super.initState();
    futureWizards = service.getWizards();
  }

  void _refresh() {
    setState(() {
      futureWizards = service.getWizards();
    });
  }

  /// Diálogo de confirmación antes de eliminar
  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Do you want to delete the wizard?"),
            content: const Text("This action can not be undone."),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context, false),
              ),
              TextButton(
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        ) ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wizards list", style: GoogleFonts.bagelFatOne(),),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WizardFormScreen(onSaved: _refresh))), 
        ),
        body: 
          FutureBuilder(
          future: futureWizards, 
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            
            final wizards = snapshot.data!; //List(wizards)

            if(wizards.isEmpty) {
              return const Center(
                child: Text('No wizards found\n Pulse + button to add one.', 
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
              );
            }

            return ListView.builder(
                itemCount: wizards.length,
                itemBuilder: (context, index) {
                  final w = wizards[index];
                  final house = w.houseName ?? 'TBC';
                  final wand = (w.wandCore != null && w.wandWood != null) ? '${w.wandWood} - ${w.wandCore}' : 'TBC';

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.rowing),
                      title: Text('Wizard: ${w.name}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),), 
                      subtitle: Text('Age: ${w.age}\nHouse: $house\nWand: $wand'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // --- ICONO EDITAR ---
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blueAccent),
                            tooltip: "Update wizard",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => WizardFormScreen(
                                    wizard: w,
                                    onSaved: _refresh,
                                  ),
                                ),
                              );
                            },
                          ),

                          // --- ICONO ELIMINAR ---
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            tooltip: "Delete wizard",
                            onPressed: () async {
                              final confirm = await _confirmDelete(context);
                              if (confirm) {
                                await service.deleteWizard(w.id);
                                _refresh();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
              );
            }
          )
    );
  }
}

