import 'package:flutter/material.dart';
const MyPrimaryColor = Color(0xff9ddbda);
const MySecondaryColor = Color(0xff6d5f52);

final myProgressIndicator = CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(MyPrimaryColor),
                strokeWidth: 3,
              );