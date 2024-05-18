import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingNotification extends StatefulWidget {
  const SettingNotification({Key? key}) : super(key: key);

  @override
  _SettingNotificationState createState() => _SettingNotificationState();
}

class _SettingNotificationState extends State<SettingNotification> {
  bool isMetricSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildContainerWithSwitchButton("Workout Remindera", isMetricSelected, (value) {
            setState(() {
              isMetricSelected = value;
            });
          }),
          _buildContainerWithSwitchButton("Program Notifications", !isMetricSelected, (value) {
            setState(() {
              isMetricSelected = !value;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildContainerWithSwitchButton(String text, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.sp, color: Colors.grey.shade800),
            top: BorderSide(width: 1.sp, color: Colors.grey.shade800),
          ),
          color: Colors.transparent, // Container color remains transparent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: "SF Pro Text",
                fontWeight: FontWeight.w600,
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: value ? Color(0xffD0FD3E) : Colors.grey, // Change switch color based on value
            ),
          ],
        ),
      ),
    );
  }
}
