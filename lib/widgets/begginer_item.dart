import 'package:fitapp/data/dummydata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/begginercats.dart';

class BegginerItem extends StatelessWidget {
  const BegginerItem({super.key,required this.subtitle,required this.title,required this.image});
final String title;
final String image;
final String subtitle;

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.fill),
              //color: Colors.white
            ),
            height: 160.sp,
            width: 327.sp,
            child: Padding(
              padding: EdgeInsets.all(
                22.0.sp,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20.0.sp,
                            fontFamily: "SF Pro Text",
                            color: Colors.white),
                      )),

                  //10.verticalSpace,
                  Row(
                    children: [
                      SizedBox(
                        height: 10.sp,

                        child: VerticalDivider(color: Color(0xffD0FD3E),thickness: 3.5,),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            subtitle,
                            style: TextStyle(
                                fontSize: 18.0.sp,
                                fontFamily: "SF Pro Text",
                                color: Color(0xffD0FD3E)),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
