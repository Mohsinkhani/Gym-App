import 'package:fitapp/View/info_screens/genderscreen.dart';
import 'package:fitapp/View/info_screens/height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightScreen extends StatefulWidget {
  WeightScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  RulerPickerController? _rulerPickerController;

  num currentValue = 5;

  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 10, scale: 0.1),
    RulerRange(begin: 0, end: 170, scale: 1),
    RulerRange(begin: 0, end: 170, scale: 10),
    RulerRange(begin: 0, end: 170, scale: 100),
    RulerRange(begin: 0, end: 170, scale: 1000)
  ];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }

  // Widget _buildPositionBtn(num value) {
  //   return
  //     PositionButton(
  //     value: value,
  //     onTap: () {
  //       _rulerPickerController?.value = value;
  //     },
  //   );
  // }

  Widget _buildChangeRangerBtn(String tip, List<RulerRange> rangeList) {
    return ChangeRangeButton(
      tip: tip,
      rangeList: rangeList,
      onTap: () {
        setState(() {
          ranges = rangeList;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.center ,
        children: <Widget>[
          Text(
            "what is your weight?",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          Text(
            "THIS HELP US YOUR PERSONALIZE PLAN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal,),
            textAlign: TextAlign.center,
          ),
          180.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentValue.toStringAsFixed(1),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SF Pro Text",
                    fontSize: 80),
              ),Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                 "Kg",
                  style: const TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "SF Pro Text",
                      fontSize: 20),
                ),
              ),

            ],
          ),
          RulerPicker(
            rulerScaleTextStyle: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
            rulerBackgroundColor: Colors.transparent,
            controller: _rulerPickerController!,
            onBuildRulerScaleText: (index, value) {
              return value.toInt().toString();
            },
            ranges: ranges,
            scaleLineStyleList: const [
              ScaleLineStyle(
                  color: Color(0xffD0FD3E), width: 1.5, height: 30, scale: 0),
              ScaleLineStyle(
                  color: Color(0xffD0FD3E), width: 1, height: 25, scale: 5),
              ScaleLineStyle(
                  color: Color(0xffD0FD3E), width: 1, height: 15, scale: -1)
            ],
            onValueChanged: (value) {
              setState(() {
                currentValue = value;
              });
            },
            width: MediaQuery.of(context).size.width,
            height: 80,
            rulerMarginTop: 8,
          ),
          SizedBox(height: 40,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     _buildPositionBtn(8.4),
          //     SizedBox(width: 10),
          //     _buildPositionBtn(30),
          //     SizedBox(width: 10),
          //     _buildPositionBtn(50.5),
          //     SizedBox(width: 10),
          //     _buildPositionBtn(1000),
          //     SizedBox(width: 10),
          //     _buildPositionBtn(40000),
          //     SizedBox(width: 10),
          //     _buildPositionBtn(50000),
          //   ],
          // ),
          // SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     _buildChangeRangerBtn("[20,100,1],[100,200,0.1]", [
          //       RulerRange(begin: 20, end: 100, scale: 1),
          //       RulerRange(begin: 100, end: 200, scale: 0.1)
          //     ]),
          //     SizedBox(width: 10),
          //     _buildChangeRangerBtn(
          //         "[100,500]", [RulerRange(begin: 100, end: 500)]),
          //   ],
          // ),

        ],
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_circle_left_sharp,color: Colors.white,size: 40.sp,)),
              Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xffD0FD3E)
              ),
                  height: 55.sp,
                  width: 120.sp,
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HeightScreen()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Next"),
                        Image.asset("assets/images/chevron-right.png")
                      ],
                    ),
                  ),
                )
              ),
            ],
          ),
        )
    );
  }
}



class ChangeRangeButton extends StatelessWidget {
  final String tip;
  final List<RulerRange> rangeList;
  final VoidCallback onTap;

  const ChangeRangeButton(
      {Key? key, required this.tip, required this.rangeList, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        color: Colors.white,
        child: Text(
          tip,
          style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
        ),
      ),
    );
  }
}
