import 'package:fitapp/View/app_screens/home_handling_pageview/pageview.dart';
import 'package:fitapp/View/app_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          56.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white12
                ),
                height: 30.sp,
                width: 30,

                child:
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,color: Colors.white,
                    ),
                  ),
                )),

          ),
          26.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left: 16.0.sp,top: 8.sp,bottom: 8.sp),
            child: Text("VERIFICATION",style: TextStyle(color: Colors.white,fontSize: 24.sp),),
          ),
          8.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left: 16.0.sp,top: 8.sp,bottom: 8.sp),
            child: Text("ENTER YOUR INFORMATION BELOW OR \n LOGIN WITH OTHER ACCOUNT",style: TextStyle(color: Colors.white,
              fontSize: 10.sp,
            ),),
          ),
          20.verticalSpace,
          OtpTextField(
            obscureText: true,
            numberOfFields: 6,
            borderColor: Colors.white,
            focusedBorderColor:  Colors.green,
            textStyle:TextStyle(color: Colors.white),
             // style: TextStyle(color: Colors.white),
            showFieldAsBox: false,
            borderWidth: 1.5,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here if necessary
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {

            },
          ),
          100.verticalSpace,
          Center(child: Text("Did you recieve any code?",style: TextStyle(color: Color(0xffD0FD3E),fontFamily: "SF Pro Rounded"),)),
          25.verticalSpace,
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PageViewScreen()));
            },
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding:  EdgeInsets.only(right: 16.0.sp),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: Color(0xffD0FD3E)
                  ),
                  height: 55.sp,
                  width: 260.sp,
                  child: Center(
                      child: Text("Verify",style: TextStyle(fontFamily: "SF Pro Text",fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
