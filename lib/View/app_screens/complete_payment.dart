import 'dart:ui';

import 'package:fitapp/View/app_screens/videoplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/begginercats.dart';

class CompletePayment extends StatefulWidget {
  const CompletePayment({super.key,required this.trainerList, required this.selectedDate, required this.selectedTime});
  final trainercats trainerList;
  final DateTime selectedDate;
  final DateTime selectedTime;
  @override
  State<CompletePayment> createState() => _CompletePaymentState();
}

class _CompletePaymentState extends State<CompletePayment> {

  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor:  Color(0xffD0FD3E),
                    value: _isChecked,checkColor: Colors.black,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });},
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 12.sp),
                    child: Text("Payment Completed!",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",),),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 22.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("You have book a new oppointment \n with your trainer",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",),)),
            ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            color: Color(0xff2C2C2E),
          ),
          width: 327.sp,
          height: 293.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Trainer",style: TextStyle(fontFamily: "SF Pro Text",color: Colors.white),),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(widget.trainerList.image),fit: BoxFit.fill)
                      ),
                      height: 64.sp,
                      width: 60.sp,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(children: [Text(widget.trainerList.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp,color: Colors.white,
                              fontFamily: "SF Pro Text"),),
                            30.horizontalSpace,
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffD0FD3E)
                                ),
                                height: 20.sp,
                                width: 40.sp,
                                child: Center(child: Text(widget.trainerList.rating,style: TextStyle(fontFamily: "SF Pro Text"),))),
                          ]),
                          Text(widget.trainerList.exercisetype,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.sp,color: Colors.white,
                              fontFamily: "SF Pro Text"),),
                          Padding(
                            padding:  EdgeInsets.only(top: 8.0),
                            child: Text(widget.trainerList.experience,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.sp,color: Color(0xffD0FD3E),
                                fontFamily: "SF Pro Text"),),
                          ),
                        ],
                      ),
                    ),
                  ),
              
                ],
              ),
              Divider(
                endIndent: 20.sp,
                indent: 20.sp,
                color: Colors.grey,
                thickness: 0.5.sp,
              ),
              SizedBox(height: 20),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.sp,bottom: 5.sp),
                child: Text(
                  'Date:',
                  style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: "SF Pro Text",),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.sp),
                child: Text(
                  '${widget.selectedDate.day}/${widget.selectedDate.month}/${widget.selectedDate.year}',
                  style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: "SF Pro Text",),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.sp,),
                child: Text(
                  'Time:',
                  style: TextStyle(fontSize: 14,color: Colors.white,  fontFamily: "SF Pro Text",),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 20.0.sp),
                    child: Text(
                      '${widget.selectedTime.hour}:${widget.selectedTime.minute.toString().padLeft(2, '0')} ${widget.selectedTime.hour < 12 ? 'AM' : 'PM'}',
                      style: TextStyle(fontSize: 18,color: Colors.white,   fontFamily: "SF Pro Text",),
                    ),
                  ),
                  // 140.horizontalSpace,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications,color: Colors.white,),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),


          ],
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayer()));
          },
          child: GestureDetector(
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
                      surfaceTintColor:Colors.green,
                      backgroundColor:Colors.black,
                      child: SizedBox(
                        height: 0.3.sh,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayer()));
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
                                    height: 70.sp,
                                    width: 247.sp,
                                    child: Center(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            FittedBox(child: Text("Do You want to play demo video",style: TextStyle(fontFamily: "SF Pro Text",fontSize: 15),maxLines: 2)),
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
                                child: Text("Play Later",style: TextStyle(
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
            child: Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xffD0FD3E)
            ),
              height: 50.sp,
              width: 263.sp,
              child: Center(child: Text("Done",style: TextStyle(fontSize: 17.sp,color:Colors.black,fontFamily: "SF Pro Text",fontWeight: FontWeight.w700),)),
            ),
          ),
        )
    );
  }
}
