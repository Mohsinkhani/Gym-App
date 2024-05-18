import 'package:fitapp/data/notificationsdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/begginercats.dart';

class CustomNotifications extends StatefulWidget {
  const CustomNotifications({Key? key, }) : super(key: key);
  @override
  State<CustomNotifications> createState() => _CustomNotificationsState();
}

class _CustomNotificationsState extends State<CustomNotifications> {

  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 16,top: 12.sp),
      shrinkWrap: true,
      itemCount: dummynotifications.length,
      itemBuilder: (context, index) {
        return Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.2,
            motion: ScrollMotion(),
            children: [
              SlidableAction(onPressed: (BuildContext context ){},
                backgroundColor: Color(0xFFFE4A49),
                flex: 1,
                foregroundColor: Colors.white,
                icon: Icons.delete,

                //  label: 'Delete',
              ),

            ],),
          endActionPane:  ActionPane(
              extentRatio: 0.2,
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  flex: 1,
                  onPressed: (BuildContext context ){},
                  backgroundColor: Color(0xFFFE4A49),
                  icon: Icons.delete,
                  // label: 'Archive',
                ),


              ]),

          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedindex=index;
              });
            },
            child: Container(
              //height: 63.sp,
              width: 330.sp,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey),
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 8.0.sp,bottom: 8.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectedindex == index ?
                        Container(
                          height: 8.sp,
                          width:8.sp,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffD0FD3E)
                          ),):SizedBox.shrink(),
                        5.horizontalSpace,
                        Expanded(
                          child: Text(
                            dummynotifications[index].title,
                            style: TextStyle(color: Colors.white, fontFamily: "SF Pro Text"),
                          ),
                        ),
                        Text(
                          dummynotifications[index].time,
                          style: TextStyle(color: Colors.white, fontFamily: "SF Pro Text"),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Padding(
                      padding:  EdgeInsets.only(left: 8.0.sp),
                      child: Text(
                        dummynotifications[index].subtitle,
                        style: TextStyle(color: Colors.white, fontFamily: "SF Pro Text"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        );
      },
    );
  }
}
