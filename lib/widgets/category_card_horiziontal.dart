import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {

  final category;
  final imgUrl;

  const CategoryCard({Key key, this.category, this.imgUrl}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CategoryCardState(category: category,imgUrl: imgUrl);
}

class _CategoryCardState extends State<CategoryCard> {

  final category;
  final imgUrl;

  _CategoryCardState({this.imgUrl, this.category});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: NetworkImage(imgUrl),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
                width: MediaQuery.of(context).size.width * 1 / 2,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.width * 1 / 2 * 2 / 3,
                
              ),
            ),
            // Positioned(top: 10, right: 10, child: Text("Fav")),
            Positioned(
              left: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$category",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      
                    ]),
              ),
            )
          ],
        )
      ]),
    );
  }
}
