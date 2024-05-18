import 'dart:ui';

import 'package:fitapp/View/app_screens/premium_screen.dart';
import 'package:fitapp/View/app_screens/trainers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/dummydata.dart';
import 'begginer_item.dart';

class AllcategoriesItem extends StatelessWidget {
  const AllcategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,

          itemCount: dummydata.length,
          shrinkWrap: true,

          itemBuilder: (context,index)=>
              GestureDetector(
                onTap: (){
                  Positioned.fill(child: BackdropFilter(
                    filter:  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ));
                  showDialog<String>(
                  context: context,
                 // barrierDismissible: barrierDismissible,
                  // false = user must tap button, true = tap outside dialog
                  builder: (BuildContext dialogContext) {
                    return Dialog(
                      elevation: 5,
                      backgroundColor:Colors.black,
                child: SizedBox(
                  height: 0.5.sh,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage(dummydata[index].image),fit: BoxFit.fill)
                          ),
                          height: 0.26.sh,
                            width: 350.sp,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(dummydata[index].title,style: TextStyle(
                                    fontSize: 20.0.sp,
                                    fontFamily: "SF Pro Text",
                                    color: Colors.white,fontWeight: FontWeight.w600),
                                                                ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 10.sp,

                                        child: VerticalDivider(color: Color(0xffD0FD3E),thickness: 3.5,),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            dummydata[index].subtitle,
                                            style: TextStyle(
                                                fontSize: 18.0.sp,
                                                fontFamily: "SF Pro Text",
                                                color: Color(0xffD0FD3E)),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                      30.verticalSpace,
                      InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Trainers()));
                        },
                        child: Align(
                          alignment: Alignment.center ,
                          child: Padding(
                            padding:  EdgeInsets.only(right: 16.0.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.sp),
                                  color: Color(0xffD0FD3E)
                              ),
                              height: 50.sp,
                              width: 247.sp,
                              child: Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Take Appointment"),
                                      Image.asset("assets/images/chevron-right.png")
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      Center(
                        child: TextButton(onPressed: (){
                          Navigator.pop(context);
                        },
                          child: Text("cancel",style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "SF Pro Text",
                            color: Colors.white
                          ),),
                        ),
                      )
                    ],
                  ),
                ) ,

                    );
                  },
                );
              },
                  child: BegginerItem(subtitle: dummydata[index].subtitle, title: dummydata[index].title, image: dummydata[index].image,))
      ),
    );
  }
}
