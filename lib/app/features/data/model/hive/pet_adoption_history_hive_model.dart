import 'package:hive/hive.dart';

part 'pet_adoption_history_hive_model.g.dart';

@HiveType(typeId: 1)
class AdoptedPet {
  @HiveField(0)
  final String petName;
  @HiveField(1)
  final DateTime adoptedDate;

  AdoptedPet({required this.petName, required this.adoptedDate});
}
