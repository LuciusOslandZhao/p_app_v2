import 'package:flutter/material.dart';
import 'package:p_app_v2/models/property_model.dart';

class PropertyIconInfo extends StatefulWidget {
  final double size;
  final PropertyModel property;
  final Color imageColor;
  final Color textColor;

  PropertyIconInfo({this.property, this.imageColor, this.textColor, this.size=10});
  @override
  _PropertyIconInfoState createState() => _PropertyIconInfoState(
      size: size,
      property: property,
      imageColor: imageColor,
      textColor: textColor);
}

class _PropertyIconInfoState extends State<PropertyIconInfo> {
  final double size;
  final PropertyModel property;
  final Color imageColor;
  final Color textColor;

  _PropertyIconInfoState(
      {this.size, this.property, this.imageColor, this.textColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        children: [
          Image(
            width: size,
            fit: BoxFit.contain,
            color: imageColor,
            image: AssetImage("assets/images/bedroom.png"),
          ),
          Text(
            "${property.bedrooms}",
            style: TextStyle(color: textColor),
          ),
          Spacer(),
          Image(
            width: size,
            fit: BoxFit.contain,
            color: imageColor,
            image: AssetImage("assets/images/bathroom.png"),
          ),
          Text(
            "${property.bathrooms}",
            style: TextStyle(color: textColor),
          ),
          Spacer(),
          Image(
            width: size,
            fit: BoxFit.contain,
            color: imageColor,
            image: AssetImage("assets/images/car.png"),
          ),
          Text(
            "${property.garages}",
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
