import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: Text("Adopted Pets History"), centerTitle: false,),
      body: Obx(() {
        var adoptedPets = controller.pets.where((pet) => pet.isAdopted).toList();
        return ListView.builder(
          itemCount: adoptedPets.length,
          itemBuilder: (context, index) {
            final pet = adoptedPets[index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(pet.imageUrl)),
              title: Text(pet.name),
              subtitle: Text("Adopted ${pet.age} years ago"),
            );
          },
        );
      }),
    );
  }
}
