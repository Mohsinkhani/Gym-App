import 'package:fitapp/View/app_screens/videoplayer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../data/dummydata.dart';
import '../../widgets/canvas_circular_indicator.dart';
import '../../widgets/day1_list.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int selectedindex = 0;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
  }

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    var tempDate = DateTime(_currentDate.year, _currentDate.month, 1);
    var lastDayOfMonth =
        DateTime(_currentDate.year, _currentDate.month + 1, 0).day;
    var weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200.sp,
                width: 375.sp,
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: Color(0xff2C2C2E),
                  borderRadius: BorderRadius.circular(20.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: _previousMonth,
                          icon: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${DateFormat('MMMM yyyy').format(_currentDate)}',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SF Pro Text",
                              color: Colors.white),
                        ),
                        IconButton(
                          onPressed: _nextMonth,
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      height: 90.sp,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: lastDayOfMonth,
                        itemBuilder: (context, index) {
                          var date = tempDate.add(Duration(days: index));
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              width: 50.sp,
                              margin: EdgeInsets.only(right: 10.sp),
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                color: selectedindex == index
                                    ? Color(0xffD0FD3E)
                                    : Color(0xff3A3A3C),
                                borderRadius: BorderRadius.circular(40.sp),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('E').format(date),
                                    // Day of the week (e.g., Mon)
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: selectedindex == index
                                          ? Colors.black
                                          : Colors.white,
                                      fontFamily: "SF Pro Text",
                                    ),
                                  ),
                                  SizedBox(height: 5.sp),
                                  Text(
                                    DateFormat('d').format(date),
                                    // Day of the month (e.g., 18)
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: selectedindex == index
                                            ? Colors.black
                                            : Colors.white,
                                        fontFamily: "SF Pro Text"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CustomCircularIndicator(
                size: 300,
                strokeWidth: 7,
                value: 0.75, // Example value (0 to 1)
                calories: "750 cal", // Example calories
              ),
              20.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 55.sp,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 5.sp,
                    percent: 0.65,
                    progressColor: Color(0xffD0FD3E),
                    backgroundColor: Color(0xff2C2C2E),
                    center: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Steps",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro Text",
                              fontSize: 16.sp),
                        ),
                        Text(
                          "6540",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro Text",
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp),
                        ),
                      ],
                    ),
                  ),
                  20.horizontalSpace,
                  CircularPercentIndicator(
                    radius: 55.sp,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 5.sp,
                    percent: 0.4,
                    progressColor: Color(0xffFF2424),
                    backgroundColor: Color(0xff2C2C2E),
                    center: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Time",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro Text",
                              fontSize: 16.sp),
                        ),
                        Text(
                          "45 min",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro Text",
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp),
                        ),
                      ],
                    ),
                  ),
                  20.horizontalSpace,
                  CircularPercentIndicator(
                    radius: 55.sp,
                    lineWidth: 5.sp,
                    animation: true,
                    animationDuration: 1000,
                    percent: 0.75,
                    progressColor: Color(0xffE79332),
                    backgroundColor: Color(0xff2C2C2E),
                    center: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Heart",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro Text",
                              fontSize: 16.sp),
                        ),
                        Text(
                          "72 bpm",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro Text",
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              20.verticalSpace,
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0.sp, bottom: 10.sp),
                    child: Text(
                      "Finished Workout",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SF Pro Text",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dummydataday1.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlayer()));
                      },
                      child: Day1list(
                          image: dummydataday1[index].image,
                          title: dummydataday1[index].title,
                          duration: dummydataday1[index].duration,
                          subtile: dummydataday1[index].subtitle))),
            ],
          ),
        ),
      ),
    );
  }
}
