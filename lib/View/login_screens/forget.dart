import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitapp/View/login_screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final phonenumbercontroller = TextEditingController();
  bool loading=false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            56.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
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
                          Icons.arrow_back_ios_new,color: Colors.cyanAccent,
                        ),
                      ),
                    )),

            ),
            26.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("FORGET PASSWORD?",style: TextStyle(color: Colors.white,fontSize: 24.sp),),
            ),
            8.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ENTER YOUR INFORMATION BELOW OR \n LOGIN WITH OTHER ACCOUNT",style: TextStyle(color: Colors.white,
              fontSize: 10.sp,
              ),),
            ),
            30.verticalSpace,
            Padding(
              padding:  EdgeInsets.only(left: 22.0.sp,right: 22.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.3.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
                    controller: phonenumbercontroller,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter an email address';
                    //   } else if (!RegExp(
                    //       r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                    //       .hasMatch(value)) {
                    //     return 'Please enter a valid email address';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter phone number",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            100.verticalSpace,
            Center(child: Text("Try another way",style: TextStyle(color: Color(0xffD0FD3E),fontFamily: "SF Pro Rounded"),)),
            25.verticalSpace,
            InkWell(
              onTap: () async {
                String phoneNumber = phonenumbercontroller.text.trim();
                if (phoneNumber.isNotEmpty) {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneNumber,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {
                      print('Failed to verify phone number: ${e.message}');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Failed to verify phone number'),
                      ));
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter a phone number'),
                  ));
                }
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.sp),
                    color: Color(0xffD0FD3E),
                  ),
                  height: 55.sp,
                  width: 260.sp,
                  child: Center(
                    child: Text(
                      "Send",
                      style: TextStyle(fontFamily: "SF Pro Text", fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
