import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnitsOfMeasure extends StatefulWidget {
  const UnitsOfMeasure({Key? key}) : super(key: key);

  @override
  _UnitsOfMeasureState createState() => _UnitsOfMeasureState();
}

class _UnitsOfMeasureState extends State<UnitsOfMeasure> {
  int selectedContainerIndex = -1;

  void _handleRadioButtonTap(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

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
          icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white ,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildContainerWithRadioButton(0, "Metric"),
          _buildContainerWithRadioButton(1, "Imperial"),
        ],
      ),
    );
  }

  Widget _buildContainerWithRadioButton(int index, String text) {
    return GestureDetector(
      onTap: () {
        _handleRadioButtonTap(index);
      },
      child: Padding(
        padding:  EdgeInsets.only(left: 20.0.sp,right: 20.sp),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.sp,color: Colors.grey.shade800),top: BorderSide(width: 1.sp,color: Colors.grey.shade800)),
            color: Colors.transparent,
            //borderRadius: BorderRadius.circular(10.0),
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
                  fontWeight: FontWeight.w600
                ),
              ),
              Radio(
                value: index,
                groupValue: selectedContainerIndex,
                onChanged: (int? value) {
                  _handleRadioButtonTap(value!);
                },
                activeColor: selectedContainerIndex == index ? Color(0xffD0FD3E) : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
