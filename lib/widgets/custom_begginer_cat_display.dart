import 'package:flutter/cupertino.dart';

import '../data/dummydata.dart';
import 'begginer_item.dart';

class CustomBegginerCatDisplay extends StatelessWidget {
  const CustomBegginerCatDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,

          itemCount: dummydata.length,
          shrinkWrap: true,

          itemBuilder: (context,index)=>
              BegginerItem(subtitle: dummydata[index].subtitle, title: dummydata[index].title, image: dummydata[index].image,)
      ),
    );
  }
}
