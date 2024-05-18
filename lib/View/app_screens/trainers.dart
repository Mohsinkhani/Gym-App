import 'dart:developer';

import 'package:fitapp/View/app_screens/trainer_detail_screen.dart';
import 'package:fitapp/widgets/custom_trainer_item.dart';
import 'package:flutter/material.dart';

import '../../data/trainersdata.dart';

class Trainers extends StatelessWidget {
  const Trainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Fitness Trainers",style: TextStyle(color: Colors.white),
        ),

      ),
      body:ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: trainersdata.length,
          itemBuilder: (context,index){
          return
          InkWell(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>TrainerdetailScreen(selectedCat: trainersdata[index])));
            },
            child: CustomTrainers(name: trainersdata[index].name,
              image: trainersdata[index].image, experience: trainersdata[index].experience, exercisetype: trainersdata[index].exercisetype,
              rating: trainersdata[index].rating,),
          );
          }

      )
    );
  }
}
