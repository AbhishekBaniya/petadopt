import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:petadopt/app/features/presentation/screens/history_screen.dart';
import '../../data/model/hive/pet_hive_model.dart';
import '../../data/services/hive_db_services.dart';
import '../controllers/home_controller.dart';
import 'details_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(hiveService: HiveService(petBox: Hive.box<Pet>('pets'))));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: Text("Pet Adoption App"), centerTitle: false, actions: [InkWell(onTap: ()=> Get.to(()=> HistoryPage()), child: Text("History", style: TextStyle( fontSize: 18),))],),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (query) {
                    controller.searchQuery.value = query;
                    controller.searchPets();
                  },
                  decoration: InputDecoration(labelText: 'Search Pets'),
                ),
              ),
              Obx(() => Expanded(
                child: ListView.builder(
                  itemCount: controller.pets.length,
                  itemBuilder: (context, index) {
                    final pet = controller.pets[index];
                    return ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(pet.imageUrl)),
                      title: Text(pet.name),
                      subtitle: Text("${pet.age} years - \$${pet.price}"),
                      trailing: pet.isAdopted ? Container(alignment: Alignment.center, width: 80, height: 40, decoration: BoxDecoration(border: Border.all(color: Colors.red,), borderRadius: BorderRadius.circular(8.0),), child: Text('Sold'),) : Container(alignment: Alignment.center, width: 80, height: 40, decoration: BoxDecoration(border: Border.all(color: Colors.green,), borderRadius: BorderRadius.circular(8.0),), child: Text('Available'),),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>DetailsPage(pet: pet))),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
