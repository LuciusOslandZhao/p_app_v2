import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  final Function onPressed;
  final bool isFav;

  const FavouriteButton({Key key, this.onPressed, this.isFav}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _FavouriteButtonState(onPressed: onPressed, isFav: isFav);
}

class _FavouriteButtonState extends State<FavouriteButton> {
  Function onPressed;
  bool isFav;

  void _toggleFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  _FavouriteButtonState({this.onPressed, this.isFav});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: isFav ? Colors.yellow : Colors.white,
        icon: isFav ? IsFavIcon : NotFavIcon,
        onPressed: () {
          _toggleFav();
          onPressed();
        });
  }
}

const IsFavIcon = Icon(Icons.star);
const NotFavIcon = Icon(Icons.star_border);
