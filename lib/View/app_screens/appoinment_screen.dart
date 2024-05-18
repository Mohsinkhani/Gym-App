import 'dart:math';

import 'package:fitapp/View/app_screens/payment_screen.dart';
import 'package:fitapp/data/trainersdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fitapp/model/begginercats.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key, required this.selectedcat})
      : super(key: key);

  final trainercats selectedcat;

  @override
  Widget build(BuildContext context) {
    return
  Material(
    child: Scaffold(
          backgroundColor: Colors.black, // Set scaffold background color
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text("APPOINTMENT",style: TextStyle(fontFamily: "FSP DEMO - integral CF Bold",
                color: Colors.white,fontWeight: FontWeight.w500),),
          ),

          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                              image: DecorationImage(
                                image: AssetImage(selectedcat.image),
                                fit: BoxFit.fill,
                              ),
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
                                Row(
                                  children: [
                                    Text(
                                      selectedcat.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Set font weight to bold
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                        fontFamily: "SF Pro Text",
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffD0FD3E),
                                      ),
                                      height: 20.sp,
                                      width: 40.sp,
                                      child: Center(
                                        child: Text(
                                          selectedcat.rating,
                                          style: TextStyle(
                                            fontFamily: "SF Pro Text",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  selectedcat.exercisetype,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: Color(0xffD0FD3E),
                                    fontFamily: "SF Pro Text",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    selectedcat.experience,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: Color(0xffD0FD3E),
                                      fontFamily: "SF Pro Text",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AppointmentCalendar(selectedCats: selectedcat,),
                ),
              ],
            ),
          ),
        ),
  );

  }
}

class AppointmentCalendar extends StatefulWidget {
  final trainercats selectedCats;
  const AppointmentCalendar({super.key, required this.selectedCats});
  @override
  State<AppointmentCalendar> createState() => _AppointmentCalendarState();
}

class _AppointmentCalendarState extends State<AppointmentCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late DateTime _selectedTime;

  Map<DateTime, List<DateTime>> _appointments = {};

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _selectedTime = DateTime.now();

    _generateRandomAppointments(_focusedDay);
  }

  void _generateRandomAppointments(DateTime day) {
    final Random random = Random();

    _appointments[day] = List.generate(
      random.nextInt(2) + 4, // Random number of appointments between 4 and 5
          (index) {
        return DateTime(

          day.year,
          day.month,
          day.day,
          random.nextInt(12) + 8, // Random hour between 8 and 19 (7 PM)
          random.nextInt(2) * 30, // Random minute (either 0 or 30)
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
       headerStyle: HeaderStyle(titleTextStyle: TextStyle(color: Colors.white,fontFamily: "SF Pro Text")),
          daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: Colors.white,fontFamily: "SF Pro Text")),
          firstDay: DateTime.now().subtract(Duration(days: 365)),
          lastDay: DateTime.now().add(Duration(days: 365)),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;

              if (_appointments[selectedDay] == null) {
                _generateRandomAppointments(selectedDay);
              }
            });
          },
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },
          calendarFormat: CalendarFormat.month,
          calendarStyle: CalendarStyle(
            // Set calendar font color to white
            defaultTextStyle: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
            todayTextStyle: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
            selectedTextStyle: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
            weekendTextStyle: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
            holidayTextStyle: TextStyle(color: Colors.red,fontFamily: "SF Pro Text"),
              // rangeHighlightColor:Colors.green
          ),
        ),
        SizedBox(
          height: 100.sp,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: _appointments[_selectedDay]?.length ?? 0,
            itemBuilder: (context, index) {
              final appointmentTime = _appointments[_selectedDay]![index];
              final bool isSelected = appointmentTime == _selectedTime;
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTime = appointmentTime;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Appointment selected on ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year} '
                              'at ${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')} ${_selectedTime.hour < 12 ? 'AM' : 'PM'}',
                        style: TextStyle(fontFamily: "SF Pro Text",color: Colors.white),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 20.sp,
                      //width: 120.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        border: Border.all( color: isSelected ? Colors.green : Colors.white,),
                       // color: isSelected ? Colors.green : Colors.white,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          '${appointmentTime.hour}:${appointmentTime.minute.toString().padLeft(2, '0')} ${appointmentTime.hour < 12 ? 'AM' : 'PM'}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        30.verticalSpace,
        InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentScreen(
                  selectedDate: _selectedDay,
                  selectedTime: _selectedTime,
                  trainerList:widget.selectedCats ,
                ),
              ),
            );
          },
          child: Padding(
            padding:  EdgeInsets.only(right: 16.0.sp),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.sp),
                  color: Color(0xffD0FD3E)
              ),
              height: 55.sp,
              width: 290.sp,
              child: Center(
                  child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold),)
              ),
            ),
          ),
        )
      ],
    );
  }
}



