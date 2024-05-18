import 'package:fitapp/View/info_screens/age.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding:  EdgeInsets.only(top: 25.sp,bottom: 8.sp),
                child: Text("TELL US ABOUT YOURSELF",style: TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0.sp),
              child: Text("TO GIVE YOU A BETTER EXPEIRENCE WE NEED \n TO KNOW YOUR GENEDER",style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
            ),
            108.verticalSpace,
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
                onTap: (){
                  setState(() {
                    selectedindex=0;
                  });

                }

              ,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:selectedindex ==0 ? Color(0xffD0FD3E):Color(0xff2C2C2E)
                ),
                height: 140.sp,
                width: 140.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Icon(Icons.male_sharp,size: 60.sp,color: selectedindex == 0? Colors.black:Colors.white,)),
                    19.verticalSpace,
                    Center(child: Text("Male",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.normal,color: selectedindex == 0? Colors.black:Colors.white,),))
                  ],
                ),
              ),

            ),
            44.verticalSpace,
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
                onTap: (){
                  setState(() {
                    selectedindex=1;
                  });

                }

              ,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:selectedindex ==1 ? Color(0xffD0FD3E):Color(0xff2C2C2E)
                ),
                height: 140.sp,
                width: 140.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Icon(Icons.female,size: 60.sp,color: selectedindex == 1? Colors.black:Colors.white,)),
                    19.verticalSpace,
                    Center(child: Text("Female",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.normal,color: selectedindex == 1? Colors.black:Colors.white,))),
                  ],
                ),
              ),
            ),
            132.verticalSpace,
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AgeScreen()));
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:  EdgeInsets.only(right: 16.0.sp),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.sp),
                        color: Color(0xffD0FD3E)
                    ),
                    height: 55.sp,
                    width: 120.sp,
                    child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Next"),
                            Image.asset("assets/images/chevron-right.png")
                          ],
                        )
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
