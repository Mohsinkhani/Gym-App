import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Privacy policy",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 16.0.sp,right: 16.sp),
            child: Text("Lorem ipsum dolor sit amet",style: TextStyle(
              color: Colors.white,fontFamily: "SF Pro Text",fontSize: 16.sp
            ),),
          ),
          10.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left: 16.0.sp,right: 16.sp),
            child: Text("Consectetur adipiscing elit. Natoque phasellus lobortis mattis cursus faucibus hac proin risus. Turpis phasellus massa ullamcorper volutpat. Ornare commodo non integer fermentum nisi, morbi id. Vel tortor mauris feugiat amet, maecenas facilisis risus, in faucibus. Vestibulum ullamcorper fames eget enim diam fames faucibus duis ac. Aliquam non tellus semper in dignissim nascetur venenatis lacus.",style: TextStyle(
                color: Colors.grey,fontFamily: "SF Pro Text",fontSize: 16.sp
            ),),
          ),
          10.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left: 16.0.sp,right: 16.sp),
            child: Text("Lectus vel non varius interdum vel tellus sed mattis. Sit laoreet auctor arcu mauris tincidunt sociis tristique pharetra neque. Aliquam pharetra elementum nisl sapien. Erat nisl morbi eu dolor in. Sapien ut lacus dui libero morbi tristique.",style: TextStyle(
                color: Colors.grey,fontFamily: "SF Pro Text",fontSize: 16.sp
            ),),
          ),
          10.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left: 16.0.sp,right: 16.sp),
            child: Text("Sit praesent mi, dolor, magna in pellentesque sollicitudin odio sed. Sit nibh aliquam enim ipsum lectus sem fermentum congue velit. Purus habitant odio in morbi aliquet velit pulvinar. Facilisis ut amet interdum pretium. Fames pretium eget orci facilisis mattis est libero facilisis ullamcorper. Est auctor amet egestas risus libero et. Auctor faucibus sit id fringilla vitae. Ac volutpat sodales tristique ut netus turpis.",style: TextStyle(
                color: Colors.grey,fontFamily: "SF Pro Text",fontSize: 16.sp
            ),),
          ),
        ],
      ),
    );
  }
}
