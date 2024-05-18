import 'package:fitapp/View/app_screens/complete_payment.dart';
import 'package:fitapp/View/app_screens/editcard.dart';
import 'package:flutter/material.dart';
import 'package:fitapp/model/begginercats.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'addnewcard.dart';

class PaymentScreen extends StatelessWidget {
  final DateTime selectedDate;
  final DateTime selectedTime;
  final trainercats trainerList;


  const PaymentScreen({
    Key? key,
    required this.selectedDate,
    required this.selectedTime,
    required this.trainerList,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
   // List<String> cards = [
   //  
   //
   // ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Payment',style: TextStyle(fontFamily: "FSP DEMO - integral CF Bold",color: Colors.white,fontWeight: FontWeight.w500),),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Payment method",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewCard()));
                  },
                      child: Image.asset("assets/images/addcard.png")),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditCard()));
                      },
                      child: Image.asset("assets/images/debitCard.png")),
                  Image.asset("assets/images/debitCard2.png")
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 15.0,left: 20.sp),
              child: Text(
                'Order Details',
                style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "SF Pro Text",),
              ),
            ),
            Divider(
              endIndent: 20.sp,
              indent: 20.sp,
              color: Colors.grey,
              thickness: 1.sp,
            ),

            Column(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20.sp),
                    child: Text("Trainer",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",),),
                  )),
              ListTile(
                title: Text(trainerList.name,style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",),),
                subtitle: Text(
                  (trainerList.exercisetype),style: TextStyle(color: Color(0xffD0FD3E,),fontFamily: "SF Pro Text",),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(trainerList.image),
                ),
              )
            ]),
            Divider(
              endIndent: 20.sp,
              indent: 20.sp,
              color: Colors.grey,
              thickness: 1.sp,
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
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: "SF Pro Text",),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.only(left: 20.0.sp,bottom: 5.sp),
              child: Text(
                'Time:',
                style: TextStyle(fontSize: 14,color: Colors.white,  fontFamily: "SF Pro Text",),
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(left: 20.0.sp),
              child: Text(
                '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')} ${selectedTime.hour < 12 ? 'AM' : 'PM'}',
                style: TextStyle(fontSize: 18,color: Colors.white,   fontFamily: "SF Pro Text",),
              ),
            ),
            10.verticalSpace,
            Divider(
              endIndent: 20.sp,
              indent: 20.sp,
              color: Colors.grey,
              thickness: 1.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 20.sp,top: 15.sp),
                  child: Text("Estimated Cost",style: TextStyle(
                    color: Colors.white,   fontFamily: "SF Pro Text",
                  ),),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 15.0.sp,right: 20.sp),
                  child: Text("£ 175.99",style: TextStyle(
                      color: Colors.white,   fontFamily: "SF Pro Text",
                  ),),
                ),
              ],
            ),
            15.verticalSpace,
            Divider(
              endIndent: 20.sp,
              indent: 20.sp,
              color: Colors.grey,
              thickness: 1.sp,
            ),
            30.verticalSpace,
            Align(
              alignment: Alignment.center,
              child: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>CompletePayment(trainerList: trainerList, selectedDate: selectedDate, selectedTime: selectedTime,)
                    ),
                  );
                },
                child: Padding(
                  padding:  EdgeInsets.only(right: 16.0.sp),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.sp),
                        color: Color(0xffD0FD3E)
                    ),
                    height: 55.sp,
                    width: 290.sp,
                    child: Center(
                        child: Text("Confirm",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "SF Pro Text",),)
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
