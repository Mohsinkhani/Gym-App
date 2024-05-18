import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController _cardHolderNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardtype = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  bool _isChecked = false;

  XFile? _imageFile;

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
   _cardtype.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Edit Card",
          style: TextStyle(
            fontFamily: "FSP DEMO - integral CF Bold",
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 0.9.sw,
              height: 200.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                image: DecorationImage(
                  image: AssetImage('assets/images/emptycard.png'), // Provide your image path here
                  fit: BoxFit.cover, // Adjust the fit as per your requirement
                ),
              ),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(_cardtype.text,style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 26.sp,
                          color: Colors.white
                        ),),
                      )),
                  80.verticalSpace,
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 12.0),
                        child: Text(_cardHolderNameController.text,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.white
                        ),),
                      )),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 12.0),
                        child: Text(_cardNumberController.text,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.white
                        ),),
                      ))
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.0,right: 20.sp),
              child: Container(
                decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
                child: TextField(
                  controller: _cardtype,
                  onChanged: (value) {
                    // Update the container data when text field changes
                    setState(() {});
                  },
                  style: TextStyle(color: Colors.white, fontFamily: "SF Pro Text"),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Card Type",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.0,right: 20.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: TextField(
                  controller: _cardHolderNameController,
                  onChanged: (value) {
                    // Update the container data when text field changes
                    setState(() {});
                  },
                  style: TextStyle(color: Colors.white, fontFamily: "SF Pro Text"),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Card Holder Name",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.0,right: 20.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: _cardNumberController,
                    onChanged: (value) {
                      // Update the container data when text field changes
                      setState(() {
        
                      });
                    },
                    style: TextStyle(color: Colors.white, fontFamily: "SF Pro Text"),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Card Number",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 22.0.sp, right: 22.sp),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 150.sp,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SF Pro Text",
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Expiry (MM/YY)",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro Text",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.sp, right: 10.sp),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 150.sp,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SF Pro Text",
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Cvc",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro Text",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor:  Color(0xffD0FD3E),
                  value: _isChecked,checkColor: Colors.black,
                  onChanged: (bool? value) {
                      setState(() {
                      _isChecked = value ?? false;
                      });},
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 12.sp),
                    child: Text("Set as default payment card",style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
        InkWell(
          onTap: (){
          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Trainers()));
          },
          child: Container(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(0xffD0FD3E)
          ),
            height: 50.sp,
            width: 263.sp,
            child: Center(child: Text("Done",style: TextStyle(fontSize: 17.sp,color:Colors.black,fontFamily: "SF Pro Text",fontWeight: FontWeight.w700),)),
          ),
        )
    );

  }
}
