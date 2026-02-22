import 'package:flutter/material.dart';
import '../models/house.dart';
import '../services/house_service.dart';
import '../screens/house_form_screen.dart';

class HousesListScreen extends StatefulWidget {
  const HousesListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HousesListScreenState();
}


class _HousesListScreenState extends State<HousesListScreen> {

  final service = HouseService();
  late Future<List<House>> futureHouses;
  
  //Método inicial para cargar de primeras el contenido
  @override
  void initState() {
    super.initState();
    futureHouses = service.getHouses();
  }

    //Método para recargar casas cuando hay un cambio de estado en la lista
  void _refresh() {
    setState(() {
      futureHouses = service.getHouses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: const Text("Houses list"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HouseFormScreen(onSaved: _refresh,))),
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: futureHouses, 
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final houses = snapshot.data!; //List(houses)

            if(houses.isEmpty) {
              return const Center(
                child: Text('No houses found'),
              );
            }
            
            return ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  final house = houses[index];
                  return ListTile(
                    leading: Icon(Icons.house),
                    title: Text('House: ${house.name}'),
                    subtitle: Text('Founder: ${house.founder}'),
                    trailing: IconButton(
                      onPressed: () async {
                        await service.deleteHouse(house.id);
                        _refresh();
                        },
                      icon: const Icon(Icons.delete)),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HouseFormScreen(house: house, onSaved: _refresh)))
                  );
                }
              );
          }
        )
    );
  }
  
}