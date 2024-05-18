import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitapp/View/app_screens/home_handling_pageview/pageview.dart';
import 'package:fitapp/View/app_screens/home_screen.dart';
import 'package:fitapp/View/login_screens/forget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      //crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 420.sp,
          width: 375.sp,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login1.png"))),
          //    child: Image.asset("assets/images/login1.png")
          child: Padding(
            padding: EdgeInsets.only(top: 22.sp, right: 20.0.sp),
            child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    height: 60.sp,
                    width: 60.sp,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Image.asset("assets/images/login2.png")))),
          ),
        ),
        30.verticalSpace,
        Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,

                    style: TextStyle(
                        color: Colors.white, fontFamily: "SF Pro Text"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter an email";
                      }
                      return null;
                    },

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
                      focusColor: Colors.grey,
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "SF Pro Text",
                      ),
                      errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontFamily: "SF Pro Text"),
                    ),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter an email";
                      }
                      return null;
                    },
                    controller: passwordcontroller,
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.white, fontFamily: "SF Pro Text"),
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
                          fontFamily: "SF Pro Text"),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                  ),
                ),
              ],
            )),
        10.verticalSpace,
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgetPass()));
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                        color: Colors.green, fontFamily: "SF Pro Text"),
                  )),
            )),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 22.0.sp, top: 8.sp),
          child: Row(
            children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPass()));
                  },
                  child: Image.asset("assets/images/apple.png"),
                ),

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
                      await _auth.signInWithEmailAndPassword(
                        email: emailcontroller.text,
                        password: passwordcontroller.text.toString(),
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
                        Text("LOGIN"),
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
    );
  }
}
