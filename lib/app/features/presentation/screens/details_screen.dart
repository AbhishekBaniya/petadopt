import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petadopt/app/features/presentation/screens/home_screen.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../data/model/hive/pet_hive_model.dart';
import '../controllers/home_controller.dart';

class DetailsPage extends StatelessWidget {
  final Pet pet;
  DetailsPage({super.key, required this.pet});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('Details Page'),centerTitle: false,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: PhotoViewGallery.builder(
                      itemCount: 1,
                      builder: (context, index) => PhotoViewGalleryPageOptions(imageProvider: NetworkImage(pet.imageUrl)),
                      scrollPhysics: BouncingScrollPhysics(),
                      backgroundDecoration: BoxDecoration(color: Colors.black),
                    ),
                  ),
                );
              },
              child: Image.network(pet.imageUrl, width: 250, height: 250,),
            ),
            Text(pet.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Age: ${pet.age} years"),
            Text("Price: \$${pet.price}"),
            ElevatedButton(
                onPressed: pet.isAdopted
                    ? null
                    : () {
                  controller.adoptPet(controller.pets.indexOf(pet));
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => Dialog(

                      child: Container(alignment: Alignment.center, height: 300,decoration: BoxDecoration(), child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.check_circle, size: 50, color: Colors.green.shade500,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("You’ve adopted ${pet.name}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                            }, child: Text("Done")),
                          )
                        ],
                      )),
                    ),
                  ).then((valueFromDialog){
                    // use the value as you wish
                    print(valueFromDialog);
                  });
                },
                child: Text(pet.isAdopted ? 'Already Adopted' : 'Adopt Me')),
          ],
        ),
      ),
    );
  }
}
