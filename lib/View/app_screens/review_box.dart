import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewBox extends StatelessWidget {
  //const ReviewBox({super.key});
  TextEditingController detailsController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("WRITE A REVIEW",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w500),),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(right: 8.0.sp,left: 12.sp,top: 10.sp),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: 350.sp,
              child: TextFormField(
                maxLines: 7,
                controller: detailsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  fillColor: Color(0xff2C2C2E),
                  focusColor: Colors.white,
                  hintText: "Review (Optional)",
                  hintStyle: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w500,fontFamily: "SF Pro Text"),
                  enabledBorder: InputBorder.none,
                ),

              ),
            ),
          ),
          40.verticalSpace,
          InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffD0FD3E)
              ),
              height: 50.sp,
              width: 263.sp,
              child: Center(child: Text("Send",style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: "SF PRo Text"),)),
            ),
          )
        ],
      ),
    );
  }
}
