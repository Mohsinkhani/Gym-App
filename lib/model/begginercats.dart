import 'package:fitapp/model/begginercats.dart';
import 'package:fitapp/model/begginercats.dart';
import 'package:fitapp/model/begginercats.dart';

import 'begginercats.dart';

class begginercat{
const begginercat({
  required this.image,
  required this.title,
  required this.subtitle,
  required this.pro,
  required this.duration,

});

 final String image;
final String title;
final String subtitle;
final String pro;
final String duration;

}

class trainercats{
  const trainercats({
    required this.reviews,
    required this.rating,
    required this.exercisetype,
    required this.experience,
    required this.image,
    required this.name,
    required this.clients,
    required this.complete,
    required this.exp,
});
  final String rating;
  final String experience;
  final String exercisetype;
  final String image;
  final String name;
  final int exp;
  final int complete;
  final int clients;
  final List<Reviews> reviews;
}
class Reviews{
  const Reviews({
    required this.image,required this.name,required this.rating,required this.comment,required this.timeduration

  });
  final String image;
  final String name;
  final double rating;
  final String timeduration;
  final String comment;
}
class Notifications{
  const Notifications({
    required this.time,required this.title,required this.subtitle,

  });
  final String title;
  final String time;
  final String subtitle;
}
