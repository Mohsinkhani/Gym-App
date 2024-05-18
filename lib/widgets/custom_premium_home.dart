import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPremiumHome extends StatefulWidget {
  const CustomPremiumHome({super.key});

  @override
  State<CustomPremiumHome> createState() => _CustomPremiumHomeState();
}

class _CustomPremiumHomeState extends State<CustomPremiumHome> {
  int selectedPaymentOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: ListView(

          children: [
            20.verticalSpace,
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("This is premium, please make sure your subscription",style: TextStyle(
               fontFamily: "SF Pro Text",fontSize: 17.sp,fontWeight: FontWeight.w500,color: Colors.white

             ),textAlign: TextAlign.center,),
           ),
            10.verticalSpace,
            buildContainer(0, 'Monthly',"\$19.99/m","Pay monthly, cancel any time"),
            buildContainer(1, 'Yearly',"\$129.99/y","Pay for a full year"),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>WeightScreen()));
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: Color(0xffD0FD3E)
                  ),
                  height: 55.sp,
                  width: 300.sp,
                  child: Center(
                      child: Text("Subscribe Now",style: TextStyle(fontSize: 17.sp,fontFamily: "SF Pro Text",fontWeight: FontWeight.w700,),)
                  ),
                ),
              ),
            ),
            30.verticalSpace,
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
      margin: EdgeInsets.all(16.0),
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
