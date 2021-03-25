import 'package:flutter/material.dart';
const MyPrimaryColor = Color(0xff9ddbda);
const MySecondaryColor = Color(0xff6d5f52);

final myProgressIndicator = CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(MyPrimaryColor),
                strokeWidth: 3,
              );
final iconHeight = 30.00;
final iconWidth = 30.00;
final bathroomIcon = Image(
  width: iconWidth,
  height: iconHeight,
  fit: BoxFit.fill,
  image: AssetImage('assets/images/bathroom.png'),);

  final bedroomIcon = Image(
  width: iconWidth,
  height: iconHeight,
  fit: BoxFit.fill,
  image: AssetImage('assets/images/bedroom.png'),);

  final garageIcon = Image(
  width: iconWidth,
  height: iconHeight,
  fit: BoxFit.fill,
  image: AssetImage('assets/images/car.png'),);

  