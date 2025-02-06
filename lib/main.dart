import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:petadopt/app/features/data/services/hive_db_services.dart';

import 'app/features/data/model/hive/pet_adoption_history_hive_model.dart';
import 'app/features/data/model/hive/pet_hive_model.dart';
import 'app/features/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PetAdapter());
  Hive.registerAdapter(AdoptedPetAdapter());
  await Hive.openBox<Pet>('pets');

  // Add default pets if the box is empty
  var petBox = Hive.box<Pet>('pets');
  if (petBox.isEmpty) {
    addDefaultPets(petBox);
  }

  runApp(GetMaterialApp(themeMode: ThemeMode.system, home: HomePage(),));

}

void addDefaultPets(Box<Pet> petBox) {
  final hiveService = HiveService(petBox: Hive.box<Pet>('pets'));
  // Predefined list of pets
  List<Pet> pets = [
    Pet(name: 'Buddy', age: 2, price: 100.0, imageUrl: "https://media.istockphoto.com/id/1652227141/photo/running-fluffy-pembroke-welsh-corgi-puppy.webp?a=1&b=1&s=612x612&w=0&k=20&c=G9nklNlYLRHA4-reWUszvJczeph1du1A8ZUP27lefTk=",),
    Pet(name: 'Bella', age: 3, price: 150.0, imageUrl: "https://www.shutterstock.com/image-photo/black-labrador-returning-dummy-water-260nw-1884964972.jpg",),
    Pet(name: 'Max', age: 1, price: 120.0, imageUrl: "https://plus.unsplash.com/premium_photo-1694819488591-a43907d1c5cc?q=80&w=1314&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",),
    Pet(name: 'Luna', age: 2, price: 130.0, imageUrl: "https://images.unsplash.com/photo-1615751072497-5f5169febe17?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D",),
    Pet(name: 'Charlie', age: 4, price: 200.0, imageUrl: "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D",),
    Pet(name: 'Lucy', age: 5, price: 180.0, imageUrl: "https://images.unsplash.com/photo-1625316708582-7c38734be31d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D",),
    Pet(name: 'Daisy', age: 3, price: 110.0, imageUrl: "https://plus.unsplash.com/premium_photo-1665952050053-31ac47c6ff4b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGN1dGUlMjBkb2d8ZW58MHx8MHx8fDA%3D",),
    Pet(name: 'Rocky', age: 2, price: 90.0, imageUrl: "https://images.unsplash.com/photo-1552053831-71594a27632d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGN1dGUlMjBkb2d8ZW58MHx8MHx8fDA%3D",),
    Pet(name: 'Sadie', age: 6, price: 220.0, imageUrl: "https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGN1dGUlMjBkb2d8ZW58MHx8MHx8fDA%3D",),
    Pet(name: 'Jack', age: 1, price: 95.0, imageUrl: "https://images.unsplash.com/photo-1584662740769-00475d7b5556?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGN1dGUlMjBkb2d8ZW58MHx8MHx8fDA%3D",),
  ];

  // Adding the default pets to the Hive database
  for (var pet in pets) {
    hiveService.addPet(pet);
  }
}