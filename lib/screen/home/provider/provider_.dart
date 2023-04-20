import 'dart:math';

import 'package:flutter/widgets.dart';

import '../../../utils/api_helper.dart';
import '../model/model_.dart';



class Homeprovider extends ChangeNotifier
{
  Future<RandomPerson?> findRandomPerson()
  async {
    return await ApiHelper().randomPersonApi();
  }
  List femaleImg = [
    "assets/img/f1.jpg",
    "assets/img/f2.jpg",
    "assets/img/f3.jpg",
    "assets/img/f4.jpg",
    "assets/img/f5.jpg",
  ];
  List maleImg = [
    "assets/img1/m1.jpg",
    "assets/img1/m2.jpg",
    "assets/img1/m3.jpg",
    "assets/img1/m4.jpg",
    "assets/img1/m5.jpg",
  ];

  int index = 0;
  void changeIndex()
  {
    Random randomNum = Random();
    index = randomNum.nextInt(5);
    notifyListeners();
  }

}
