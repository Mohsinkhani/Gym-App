import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitapp/View/app_screens/home_handling_pageview/pageview.dart';
import 'package:fitapp/View/login_screens/loginhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  @override
  void dispose(){
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    // reEnterPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Image.asset("assets/images/signup1.png"),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 22.0.sp,right: 22.sp),
                      child: TextFormField(
                        controller:emailcontroller,
                        style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
                        validator: (value){
                          if (value!.isEmpty){
                            return "please enter an email";
                          }
                          return null;
                        },
                        //controller: _emailController,
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
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontFamily: "SF Pro Text"
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: "SF Pro Text",
                          ),
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    Padding(
                      padding:  EdgeInsets.only(left: 22.0.sp,right: 22.sp),
                      child: TextFormField(
                        controller: passwordcontroller,
                        style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
                        validator: (value){
                          if (value!.isEmpty){
                            return "please enter an Password";
                          }
                          return null;
                        },
                        //controller: _emailController,
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
                          errorStyle: TextStyle(
                            color: Colors.red, // Change the color of the error text
                            fontSize: 14, // Change the font size of the error text
                            fontStyle: FontStyle.italic, // Apply italic style to the error text
                            // Add any other text style properties as needed
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: "SF Pro Text",
                          ),
                        ),
                      ),
                    ),
                    // 30.verticalSpace,
                    // Padding(
                    //   padding:  EdgeInsets.only(left: 22.0.sp,right: 22.sp),
                    //   child: TextFormField(
                    //     controller: reEnterPasswordController,
                    //     style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
                    //     validator: (value){
                    //       if (value!.isEmpty){
                    //         return "please enter an ReEnter Your Password";
                    //       }
                    //       return null;
                    //     },
                    //     //controller: _emailController,
                    //     // validator: (value) {
                    //     //   if (value!.isEmpty) {
                    //     //     return 'Please enter an email address';
                    //     //   } else if (!RegExp(
                    //     //       r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                    //     //       .hasMatch(value)) {
                    //     //     return 'Please enter a valid email address';
                    //     //   }
                    //     //   return null;
                    //     // },
                    //     decoration: const InputDecoration(
                    //       errorStyle: TextStyle(
                    //         color: Colors.red, // Change the color of the error text
                    //         fontSize: 14, // Change the font size of the error text
                    //         fontStyle: FontStyle.italic, // Apply italic style to the error text
                    //         // Add any other text style properties as needed
                    //       ),
                    //       labelText: "Password again",
                    //       labelStyle: TextStyle(
                    //         color: Colors.grey,
                    //         fontFamily: "SF Pro Text",
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )),

            20.verticalSpace,
            Padding(
              padding:  EdgeInsets.only(left: 22.0.sp,top: 8.sp),
              child: Row(
                children: [
                  Image.asset("assets/images/apple.png"),
                  10.horizontalSpace,
                  Image.asset("assets/images/google.png"),
                  90.horizontalSpace,
                  _isLoading
                      ? CircularProgressIndicator() // Loading indicator
                      : InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true; // Show loading indicator
                        });
                        try {
                          await _auth.createUserWithEmailAndPassword(
                            email: emailcontroller.text.trim(),
                            password: passwordcontroller.text,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => PageViewScreen()),
                          );
                        } catch (e) {
                          if (e is FirebaseAuthException) {
                            Fluttertoast.showToast(msg: e.message.toString());
                          } else {
                            Fluttertoast.showToast(msg: e.toString());
                          }
                        } finally {
                          setState(() {
                            _isLoading = false; // Hide loading indicator
                          });
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffD0FD3E),
                      ),
                      height: 55,
                      width: 120,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign Up"),
                            Image.asset("assets/images/chevron-right.png"),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
