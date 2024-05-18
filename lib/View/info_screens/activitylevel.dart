import 'package:fitapp/View/info_screens/weight.dart';
import 'package:fitapp/View/login_screens/loginhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_screens/home_handling_pageview/pageview.dart';

class ActivityLevel extends StatefulWidget {
  const ActivityLevel({super.key});

  @override
  State<ActivityLevel> createState() => _ActivityLevelState();
}

class _ActivityLevelState extends State<ActivityLevel> {
  int selectedvalue = 170;
  List<String> goals = [
    "Gain weight",
    "Loss weight",
    "Get Fittered",
    "Gain more flixible",
    "Learn the Basic"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 80.sp, bottom: 8.sp),
                child: Text(
                  "Your Regular Physical \n Avtivity Level?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Text(
                "THIS HELP US YOUR PERSONALIZE PLAN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,),
                textAlign: TextAlign.center,
              ),
            ),
            //20.verticalSpace,
            Expanded(
                child: Center(
                  child: SizedBox(
                    height: 0.7.sh,

                    child: ListWheelScrollView.useDelegate(

                      onSelectedItemChanged: (value) {
                        print(value);
                        selectedvalue = value;
                        setState(() {

                        });
                      },
                      itemExtent: 50.sp,
                      // diameterRatio: 2.0, // Adjust this value for the wheel effect
                      perspective: 0.008,
                      // Adjust this value for perspective effect
                      useMagnifier: true,
                      overAndUnderCenterOpacity: 0.4,
                      magnification: 1.5,
                      // Adjust this value for magnification effect
                      physics: const FixedExtentScrollPhysics(),
                      controller: FixedExtentScrollController(initialItem:10),
                      squeeze: 0.9,
                      // Adjust this value for minimizing the space between items
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: goals.length,
                        builder: (context, index) {
                          return Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: selectedvalue == index ? Border(
                                    bottom: BorderSide(
                                        width: 2.sp, color: Colors.green),
                                    top: BorderSide(
                                        width: 2.sp, color: Colors.green)):
                                Border.all(width: 0),
                              ),
                              width: 0.4.sw,
                              child: Center(
                                child: Text(goals[index],
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 17.sp,
                                        fontFamily: "SF Pro Text")),
                              ),
                            ),
                          );
                        },

                      ),
                    ),
                  ),
                )
            ),

          ],
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_circle_left_sharp,color: Colors.white,size: 40.sp,)),
              Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xffD0FD3E)
              ),
                  height: 55.sp,
                  width: 120.sp,
                  child: Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginhome()));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Start"),
                          Image.asset("assets/images/chevron-right.png")
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}
