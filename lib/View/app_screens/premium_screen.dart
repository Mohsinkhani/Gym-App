import 'package:fitapp/View/app_screens/addnewcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  int selectedPaymentOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(

          children: [
            Image.asset("assets/images/premiumimg1.png",),
          //  10.verticalSpace,
            buildContainer(0, 'Monthly',"\$19.99/m","Pay monthly, cancel any time"),
            buildContainer(1, 'Yearly',"\$129.99/y","Pay for a full year"),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewCard()));
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: Color(0xffD0FD3E)
                  ),
                  height: 45.sp,
                  width: 300.sp,
                  child: Center(
                      child: Text("Subscribe Now",style: TextStyle(fontSize: 17.sp,fontFamily: "SF Pro Text",fontWeight: FontWeight.w700,),)
                  ),
                ),
              ),
            ),
           // 30.verticalSpace,
          ],
        ),
      )   ,
    );
  }

  Widget buildContainer(int value, String text,String pay,String Payduration) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(24.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFF2424)),
        borderRadius: BorderRadius.circular(20.0),
        color: selectedPaymentOption == value ? Colors.red.withOpacity(0.15) : Color(0xff2C2C2E),
      ),
      child: Row(
        children: [
          Radio(
            activeColor: Color(0xffFF2424),
            value: value,
            groupValue: selectedPaymentOption,
            onChanged: (selectedValue) {
              setState(() {
                selectedPaymentOption = selectedValue as int;
              });
            },
          ),
          SizedBox(width: 8.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(text,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600,fontFamily: "SF Pro Text",color: Colors.white),),
                  100.horizontalSpace,
                  Text(pay,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600,fontFamily: "SF Pro Text",color: Colors.white),),
                ],
              ),
              Text(Payduration,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w400,fontFamily: "SF Pro Text",
                  color: selectedPaymentOption == value ?Color(0xffFF2424):Colors.white),)
            ],
          )
        ],
      ),
    );
  }
}
