import 'package:hive/hive.dart';

import '../model/hive/pet_hive_model.dart';

class HiveService {
  final Box<Pet> petBox;

  HiveService({required this.petBox});

  void addPet(Pet pet) {
    petBox.add(pet);
  }

  List<Pet> getPets() {
    return petBox.values.toList();
  }

  void adoptPet(int index) {
    final pet = petBox.getAt(index);
    pet?.isAdopted = true;
    petBox.putAt(index, pet!);
  }

  void clearPets() {
    petBox.clear();
  }
}
