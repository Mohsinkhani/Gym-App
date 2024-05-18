import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  bool showImage = true;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
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
            if (showImage)
              if (showImage)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _imageFile != null
                        ? Image.file(
                            File(_imageFile!.path),
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/images/detailscard.png"),
                  ),
                ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 40.0.sp, top: 10.sp),
                child: Text(
                  "Card Holder Name",
                  style: TextStyle(
                    color: Color(0xffD0FD3E),
                    fontFamily: "SF Pro Text",
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 40.0.sp, top: 10.sp),
                child: Text(
                  "Megan Susan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    fontFamily: "SF Pro Text",
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            Divider(
              endIndent: 20.sp,
              indent: 20.sp,
              color: Colors.grey,
              thickness: 0.5.sp,
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 40.0.sp, top: 10.sp),
                child: Text(
                  "Card Number",
                  style: TextStyle(
                    color: Color(0xffD0FD3E),fontFamily: "SF Pro Text",
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 40.0.sp, top: 10.sp),
                child: Text(
                  "5124 3256 6589 2048",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,fontFamily: "SF Pro Text",
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            30.verticalSpace,
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
                              color: Color(0xffD0FD3E),
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
                              color: Color(0xffD0FD3E),
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
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 22.0.sp, right: 22.sp),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0.sp, top: 8.sp),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showImage = false;
                    });
                  },
                  child: Text(
                    "Delete Card",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.sp,fontFamily: "SF Pro Text",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Divider(
              endIndent: 20.sp,
              indent: 20.sp,
              color: Colors.grey,
              thickness: 0.5.sp,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.0.sp,
                ),
                child: TextButton(
                  onPressed: _pickImage,
                  child: Text(
                    "Update Card",
                    style: TextStyle(
                        color: Colors.white,fontFamily: "SF Pro Text",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EditCard()),
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0.sp),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.sp),
                        color: Color(0xffD0FD3E)),
                    height: 55.sp,
                    width: 290.sp,
                    child: Center(
                        child: Text(
                      "Save",
                      style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "SF Pro Text",),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton:
        // InkWell(
        //   onTap: (){
        //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>Trainers()));
        //   },
        //   child: Container(decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(40),
        //       color: Color(0xffD0FD3E)
        //   ),
        //     height: 50.sp,
        //     width: 263.sp,
        //     child: Center(child: Text("Done",style: TextStyle(fontSize: 17.sp,color:Colors.black,fontFamily: "SF Pro Text",fontWeight: FontWeight.w700),)),
        //   ),
        // )
    );
  }
}
