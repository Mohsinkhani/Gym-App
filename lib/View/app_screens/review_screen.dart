import 'dart:math';

import 'package:fitapp/View/app_screens/review_box.dart';
import 'package:fitapp/widgets/custom_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../model/begginercats.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.selectedCat});

  final trainercats selectedCat;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late List<double> percentValues;
  late List<int> ratingValues;

  @override
  void initState() {
    super.initState();
    percentValues = List.generate(5, (index) => generateRandomPercent());
    ratingValues = List.generate(5, (index) => generateRandomRating());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Reviews",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 20.0.sp, left: 8.sp, right: 8.sp, bottom: 8.sp),
                child: Container(
                  height: 95.sp,
                  width: 100.sp,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                    widget.selectedCat.rating,
                      style: TextStyle(
                          fontFamily: "SF Pro Text",
                          fontSize: 48.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 125.sp,
                  width: 220.sp,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      for (int i = 0; i < 5; i++)
                        buildDynamicProgressBar(
                            i, percentValues[i], ratingValues[i]),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("174 Ratings",
                    style: TextStyle(
                        fontFamily: "SF Pro Text",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              )),
          SizedBox(
            width: 1.sw,
            height: 0.6.sh,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.selectedCat.reviews.length,
                itemBuilder: (context, index) {
                  return CustomReviews(
                      selectedCat: widget.selectedCat.reviews[index]);
                }),
          )
        ],
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewBox()));
          },
          child: Container(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(0xffD0FD3E)
          ),
            height: 50.sp,
            width: 263.sp,
            child: Center(child: Text("Write a review",style: TextStyle(fontSize: 17.sp,color:Colors.black,fontFamily: "SF Pro Text",fontWeight: FontWeight.w700),)),
          ),
        )
    );
  }

  Widget buildDynamicProgressBar(int index, double percent, int rating) {
    return LinearPercentIndicator(
      width: 180.sp,
      lineHeight: 5.sp,
      percent: percent,
      animationDuration: 1000,
      barRadius: Radius.circular(10),
      animation: true,
      backgroundColor: Color(0xff2C2C2E),
      progressColor: Colors.white,
      leading: Text("${5 - index}",
          style: TextStyle(fontFamily: "SF Pro text", color: Colors.white)),
      // trailing: Text("${(percent * 100).toInt()}%"),
    );
  }

  double generateRandomPercent() {
    Random random = Random();
    return random.nextDouble();
  }

  int generateRandomRating() {
    Random random = Random();
    return 1 + random.nextInt(5);
  }

  void updateValues() {
    setState(() {
      percentValues = List.generate(5, (index) => generateRandomPercent());
      ratingValues = List.generate(5, (index) => generateRandomRating());
    });
  }
}
