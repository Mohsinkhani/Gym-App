import 'package:fitapp/View/app_screens/trainers.dart';
import 'package:fitapp/View/app_screens/videoplayer.dart';
import 'package:fitapp/data/dummydata.dart';
import 'package:fitapp/widgets/day1_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutDay1 extends StatelessWidget {
  const WorkoutDay1({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/day1backgroundimage.png"),fit: BoxFit.scaleDown,
        alignment: Alignment.topCenter)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25.sp),topLeft: Radius.circular(25.sp),),
                color: Colors.black,
              ),
              height: 0.6.sh,
              width: 1.sw,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 24.0.sp,bottom: 8.sp),
                    child: Text("Day 01 - Warm Up",style: TextStyle(fontSize: 22.sp,fontFamily: "Sf Pro Text",color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.0.sp,bottom: 32.sp),
                    child: Text("04 Workouts for Begginner",style: TextStyle(fontSize: 13.sp,fontFamily: "Sf Pro Text",color: Color(0xffD0FD3E)),),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:EdgeInsets.only(left: 24.0.sp,bottom: 8.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff2C2C2E)
                              ),
                              height: 29.sp,
                              width: 86.sp,
                              child: Row(
                                children: [
                                  Icon(Icons.play_circle_sharp,color: Colors.white,),
                                  Text("60 min",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontFamily: "SF Pro Text"),),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 17.0.sp,bottom: 8.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff2C2C2E)
                              ),
                              height: 29.sp,
                              width: 86.sp,
                              child: Row(
                                children: [
                                  Icon(Icons.local_fire_department,color: Colors.white,),
                                  Text("250 Cal",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontFamily: "SF Pro Text"),),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.0.sp,top: 32.sp,bottom: 8.sp,right: 24.sp),
                    child: Text("Want your body to be healthy. Join our program with direction according to body goals.Increase physical strength is the goal of strength training.Maintain body fitness by doing physical exercise al least 2-3 times a week.",
                      style: TextStyle(fontSize: 13.95.sp,color: Colors.white,fontFamily: "SF Pro Text"),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: dummydataday1.length,
                      itemBuilder: (context,index)=>
                  GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayer()));
                      },
                      child: Day1list(image: dummydataday1[index].image, title: dummydataday1[index].title, duration: dummydataday1[index].duration, subtile: dummydataday1[index].subtitle))
                  ),
                  40.verticalSpace,
                ],
              ),
            ),
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Trainers()));
           },
           child: Container(decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(40),
             color: Color(0xffD0FD3E)
           ),
             height: 50.sp,
             width: 263.sp,
             child: Center(child: Text("Start Work Out",style: TextStyle(fontSize: 17.sp,color:Colors.black,fontFamily: "SF Pro Text",fontWeight: FontWeight.w700),)),
           ),
         )
      ),
    );
  }
}
