import 'package:flutter/material.dart';
import '../services/wand_service.dart';
import '../models/wand.dart';
import '../screens/wand_form_screen.dart';

class WandsListScreen extends StatefulWidget {
  const WandsListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WandListScreenState();
}

class _WandListScreenState extends State<WandsListScreen> {

  final service = WandService();
  late Future<List<Wand>> futureWands;

  //Método inicial para cargar de primeras el contenido
  @override
  void initState() {
    super.initState();
    futureWands = service.getWands();
  }

  //Método para recargar varitas cuando hay un cambio de estado en la lista
  void _refresh() {
    setState(() {
      futureWands = service.getWands();
    });
  }


  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headlineLarge;

    return Scaffold(
         appBar: AppBar(
          title: Row(
            children: [
              Hero(
                tag: "Wands_hero",
                child: const Icon(Icons.auto_fix_high),
              ),
              const SizedBox(width: 8),
              Text("Wands list", style: headerStyle),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WandFormScreen(onSaved: _refresh))),
          child: const Icon(Icons.add),
          ),
        body: FutureBuilder(
          future: futureWands, 
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final wands = snapshot.data!; //List(wands)

            if(wands.isEmpty) {
              return const Center(
                child: Text('Olivanders is waiting for new wands\nPulse + to manufacture one.'),
              );
            }

            return ListView.builder(
                itemCount: wands.length,
                itemBuilder: (context, index) {
                  final wand = wands[index];
                  return ListTile(
                    leading: Icon(Icons.auto_fix_high),
                    title: Text('${wand.wood} with core of ${wand.core}'),
                    subtitle: Text('Length: ${wand.length}'),
                    trailing: IconButton(
                      onPressed: () async {
                        await service.deleteWand(wand.id);
                        _refresh();
                      },
                      icon: const Icon(Icons.delete)),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WandFormScreen(wand: wand, onSaved: _refresh)))
                  );
                }
              );
          }
        )
    );
  }
}