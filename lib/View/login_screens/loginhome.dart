import 'package:fitapp/View/login_screens/login.dart';
import 'package:fitapp/View/login_screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginhome extends StatefulWidget {
  const Loginhome({super.key});

  @override
  State<Loginhome> createState() => _LoginhomeState();
}

class _LoginhomeState extends State<Loginhome> {
  final _pageController = PageController();
  int selectedIndex=1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  LoginScreen(),
                  SignUp()
                ],
              ),
              // Image.asset("assets/images/login1.png"),
          Positioned(
            top: 30.sp,left: 30.sp,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
      
                    _pageController.jumpToPage(0);
      
                    setState(() {
                      selectedIndex = 1;
      
                    });
                  },
                  child: Container(
                      height: 35.sp,
                      width: 70.sp,
                      decoration:BoxDecoration(
                          //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.sp),bottomRight: Radius.circular(8.sp)),
                          border: Border(
                              bottom: BorderSide(
                                  width: 2.sp,
                                  color:
                                  selectedIndex == 1 ?
                                  Color(0xffD0FD3E): Colors.transparent
      
                              )
                          )
                      ),
      
      
                      child: Text("Login",style:
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,color: Colors.white,fontFamily: "SF Pro Text"
      
                      )
                        ,)),
                ),
                20.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(1);
      
                    setState(() {
                      selectedIndex =2;
                    });
                  },
                  child:  Container(
                    height: 35.sp,
                    width: 85.sp,
                    decoration:BoxDecoration(
                       // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.sp),bottomRight: Radius.circular(8.sp)),
                        border: Border(
                            bottom: BorderSide(
                                width: 2.sp,
                                color:
                                selectedIndex == 2 ?
                                Color(0xffD0FD3E): Colors.transparent
      
                            )
                        )
                    ),
                    child: Text("signup",style:
                    TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: "SF Pro Text")
                      ,),),
                )],
            ),
          ),
      
      
      
      
            ],
          ),
        ),
      ),
    );
  }
}
