import 'package:get/get.dart';

import '../../data/model/hive/pet_hive_model.dart';
import '../../data/services/hive_db_services.dart';

class HomeController extends GetxController {
  final HiveService hiveService;

  HomeController({required this.hiveService});

  var pets = <Pet>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadPets();
  }

  void loadPets() {
    pets.assignAll(hiveService.getPets());
  }

  void searchPets() {
    pets.assignAll(hiveService.getPets().where((pet) => pet.name.toLowerCase().contains(searchQuery.value.toLowerCase())).toList());
  }

  void adoptPet(int index) {
    hiveService.adoptPet(index);
    loadPets();
  }
}
