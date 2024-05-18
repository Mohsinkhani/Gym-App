import 'dart:math';

import 'package:fitapp/View/app_screens/appoinment_screen.dart';
import 'package:fitapp/View/app_screens/review_screen.dart';
import 'package:fitapp/model/begginercats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/trainersdata.dart';
import '../../widgets/custom_reviews.dart';

class TrainerdetailScreen extends StatelessWidget {
  const TrainerdetailScreen({super.key, required this.selectedCat});

  final trainercats selectedCat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(selectedCat.image),
              fit: BoxFit.scaleDown,
              alignment: Alignment.topCenter)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.sp),
                    topLeft: Radius.circular(25.sp),
                  ),
                  color: Colors.black,
                ),
                height: 0.69.sh,
                width: 1.sw,
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 112.sp,
                      width: 310.sp,
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 24.0.sp, top: 32.sp, bottom: 8.sp),
                                  child: Text(
                                    selectedCat.name,
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Sf Pro Text",
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 24.0.sp, bottom: 19.sp),
                                  child: Text(
                                    selectedCat.exercisetype,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: "Sf Pro Text",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffD0FD3E)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Color(0xffD0FD3E)),
                              height:60.sp,
                              width: 60.sp,
                              child: Icon(
                                Icons.call,
                                color: Colors.black,size: 35.sp,
                              ),
                            ),
                          ),
                          20.horizontalSpace
                        ],
                      ),
                    ),

                    20.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff2C2C2E)),
                        height: 86.sp,
                        width: 310.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    selectedCat.exp.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Experience",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: "SF Pro Text"),
                                  ),
                                ),
                              ],
                            ),
                            10.horizontalSpace,
                            VerticalDivider(
                              width: 2.sp,
                              color: Colors.grey,
                              indent: 10.sp,
                              endIndent: 10.sp,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    selectedCat.complete.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Completed",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: "SF Pro Text"),
                                  ),
                                ),
                              ],
                            ),
                            10.horizontalSpace,
                            VerticalDivider(
                              width: 2.sp,
                              color: Colors.grey,
                              indent: 10.sp,
                              endIndent: 10.sp,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    selectedCat.clients.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Active Clients",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: "SF Pro Text"),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.0.sp,  bottom: 8.sp),
                        child: Text("Reviews",style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: "SF Pro Text"),),
                      ) ,
                        Padding(
                            padding: EdgeInsets.only(
                                right: 24.0.sp, bottom: 8.sp),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffD0FD3E)
                              ),
                              height: 20.sp,
                              width: 40.sp,
                              child: Center(child: Text(selectedCat.rating,style: TextStyle(fontFamily: "SF Pro Text,"),))),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.0.sp,  bottom: 8.sp),
                        child:Image.asset("assets/images/reviewsimg.png")
                      ) ,
                        Padding(
                            padding: EdgeInsets.only(
                                right: 24.0.sp, bottom: 8.sp),
                          child: TextButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewScreen(selectedCat: selectedCat,)));},
                            child: Text("Read all reviews",  style: TextStyle(
                                fontSize: 13.95.sp,
                                color: Color(0xffD0FD3E),
                                fontFamily: "SF Pro Text"),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200.sp,
                      width: 1.sw,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                          itemCount: selectedCat.reviews.length,
                          itemBuilder: (context,index) {
                            return CustomReviews(selectedCat:selectedCat.reviews[index]);
                          }
                      ),
                    ),
                    // ListView.builder(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: dummydataday1.length,
                    //     itemBuilder: (context,index)=>
                    //         Day1list(image: dummydataday1[index].image, title:selectedCat. name, duration: dummydataday1[index].duration, subtile: dummydataday1[index].subtitle)
                    // ),
                    40.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: InkWell(
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointmentScreen(selectedcat: selectedCat,)));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xffD0FD3E)),
              height: 50.sp,
              width: 263.sp,
              child: Center(
                  child: Text(
                "Book an appointment",
                style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.black,
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w700),
              )),
            ),
          )

      ),
    );
  }
}
