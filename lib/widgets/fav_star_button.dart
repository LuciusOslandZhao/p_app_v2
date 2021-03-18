import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';

class StarFavoriteButton extends StatefulWidget {
  final Function onPressed;
  bool isFavourite;

  @override
  StarFavoriteButton({Key key, this.onPressed, this.isFavourite})
      : super(key: key);
  _StarFavoriteButton createState() =>
      _StarFavoriteButton(onPressed: onPressed, isFavorite: isFavourite);
}

class _StarFavoriteButton extends State<StarFavoriteButton> {
  _StarFavoriteButton({this.onPressed, this.isFavorite});
  Function onPressed;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: IconButton(
            iconSize: 40,
            icon: IconShadowWidget(
              Icon(
                this.isFavorite ? Icons.star : Icons.star_border,
                color: this.isFavorite ? Colors.yellow : Colors.white,
                size: 40,
              ),
              shadowColor: Colors.grey,
            ),
            onPressed: () {
              onPressed();
              setState(() {
                this.isFavorite = !this.isFavorite;
                print("isFavorite ${this.isFavorite}");
              });
            }));
  }
}
