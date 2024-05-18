import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
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
          icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          30.verticalSpace,
          Center(
            child: Stack(
              children: [
                Container(
                  height: 120.sp,
                  width: 120.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: _image != null
                        ? DecorationImage(image: FileImage(_image!), fit: BoxFit.fill)
                        : DecorationImage(image: AssetImage("assets/images/login2.png"), fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  right: 0.sp,
                  bottom: 0.sp,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff2C2C2E),
                      ),
                      height: 40.sp,
                      width: 40.sp,
                      child: Center(
                        child: Icon(Icons.camera_alt, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          40.verticalSpace,
          Divider(
            height: 1.sp,
            indent: 20.sp,
            endIndent: 20.sp,
            color: Colors.grey.shade800,
          ),
          20.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left: 22.0.sp,right: 22.sp),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.3.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: Color(0xffD0FD3E),
                      fontFamily: "SF Pro Text",
                    ),
                    hintText: "Sarah Wegan",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                ),
              ),
            ),
          ),
          20.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left: 22.0.sp,right: 22.sp),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.3.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Color(0xffD0FD3E),
                      fontFamily: "SF Pro Text",
                    ),
                    hintText: "Sarah145@mail.com",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
