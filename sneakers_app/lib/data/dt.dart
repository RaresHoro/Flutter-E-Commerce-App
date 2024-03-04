import 'package:flutter/material.dart';

import '../models/models.dart';

final List<ShoeModel> availableShoes = [
  ShoeModel(
    name: "NIKE",
    model: "AIR-MAX",
    price: 130.00,
    imgAddress: "assets/images/nike1.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN MID",
    price: 190.00,
    imgAddress: "assets/images/nike8.png",
    modelColor: const Color(0xff3F7943),
  ),
  ShoeModel(
    name: "NIKE",
    model: "ZOOM",
    price: 160.00,
    imgAddress: "assets/images/nike2.png",
    modelColor: const Color(0xffE66863),
  ),
  ShoeModel(
    name: "NIKE",
    model: "Air-FORCE",
    price: 110.00,
    imgAddress: "assets/images/nike3.png",
    modelColor: const Color(0xffD7D8DC),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike5.png",
    modelColor: const Color(0xff37376B),
  ),
  ShoeModel(
    name: "NIKE",
    model: "ZOOM",
    price: 115.00,
    imgAddress: "assets/images/nike4.png",
    modelColor: const Color(0xffE4E3E8),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike7.png",
    modelColor: const Color(0xffD68043),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike6.png",
    modelColor: const Color(0xffE2E3E5),
  ),

  ShoeModel(
    name: "ADIDAS",
    model: "ULTRABOOST",
    price: 160.00,
    imgAddress: "assets/images/adidas1.png",
    modelColor: const Color(0xff000000),
  ),
  ShoeModel(
    name: "ADIDAS",
    model: "NMD",
    price: 130.00,
    imgAddress: "assets/images/adidas2.png",
    modelColor: const Color(0xff7F8287),
  ),
  ShoeModel(
    name: "ADIDAS",
    model: "SUPERSTAR",
    price: 80.00,
    imgAddress: "assets/images/adidas3.png",
    modelColor: const Color(0xffFFFFFF),
  ),
  ShoeModel(
    name: "ADIDAS",
    model: "YEEZY BOOST",
    price: 220.00,
    imgAddress: "assets/images/adidas4.png",
    modelColor: const Color(0xffD1CFCF),
  ),

  // New Puma Shoes
  ShoeModel(
    name: "PUMA",
    model: "RS-X",
    price: 110.00,
    imgAddress: "assets/images/puma1.png",
    modelColor: const Color(0xff000000),
  ),
  ShoeModel(
    name: "PUMA",
    model: "Cali",
    price: 80.00,
    imgAddress: "assets/images/puma2.png",
    modelColor: const Color(0xffF2F2F2),
  ),
  ShoeModel(
    name: "PUMA",
    model: "Thunder",
    price: 120.00,
    imgAddress: "assets/images/puma3.png",
    modelColor: const Color(0xffFAC536),
  ),
  ShoeModel(
    name: "PUMA",
    model: "Rider",
    price: 90.00,
    imgAddress: "assets/images/puma4.png",
    modelColor: const Color(0xffFFFFFF),
  ),
];

List<ShoeModel> itemsOnBag = [];

final List<UserStatus> userStatus = [
  UserStatus(
    emoji: '😴',
    txt: "Away",
    selectColor: const Color(0xff121212),
    unSelectColor: const Color(0xffbfbfbf),
  ),
  UserStatus(
    emoji: '💻',
    txt: "At Work",
    selectColor: const Color(0xff05a35c),
    unSelectColor: const Color(0xffCEEBD9),
  ),
  UserStatus(
    emoji: '🎮',
    txt: "Gaming",
    selectColor: const Color(0xffFFD237),
    unSelectColor: const Color(0xffFDDFBB),
  ),
  UserStatus(
    emoji: '🤫',
    txt: "Busy",
    selectColor: const Color(0xffba3a3a),
    unSelectColor: const Color(0xffdb9797),
  ),
];

final List categories = [
  'Nike',
  'Adidas',
  'Puma',
];
final List featured = [
  //'New',
  'Featured',
  //'Upcoming',
];

final List<double> sizes = [38, 39, 40, 41, 42, 43, 44, 45];
