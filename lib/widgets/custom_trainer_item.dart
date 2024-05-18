import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTrainers extends StatelessWidget {
  const CustomTrainers({super.key,required this.name,required this.image,required this.experience,required this.exercisetype,required this.rating});
  final String image;
  final String name;
  final String rating;
  final String exercisetype;
  final String experience;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              color: Color(0xff2C2C2E),
            ),
                width: 327.sp,
                height: 96.sp,
            child: Row(
              children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   clipBehavior: Clip.antiAlias,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill)
                   ),
                   height: 64.sp,
                   width: 60.sp,
                 ),
               ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(children: [Text(name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp,color: Colors.white,
                        fontFamily: "SF Pro Text"),),
                          30.horizontalSpace,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffD0FD3E)
                            ),
                              height: 20.sp,
                              width: 40.sp,
                              child: Center(child: Text(rating,style: TextStyle(fontFamily: "SF Pro Text"),))),
                        ]),
                        Text(exercisetype,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.sp,color: Colors.white,
                            fontFamily: "SF Pro Text"),),
                        Padding(
                          padding:  EdgeInsets.only(top: 8.0),
                          child: Text(experience,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.sp,color: Color(0xffD0FD3E),
                              fontFamily: "SF Pro Text"),),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                )
              ],
            ),

          ),
        )
      ],
    );
  }
}
