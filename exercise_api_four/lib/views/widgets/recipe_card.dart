import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  const RecipeCard({Key? key,
   required this.title,
    required this.rating,
    required this.cookTime,
    required this.thumbnailUrl,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(0,10),
            blurRadius: 10,
            spreadRadius: -6,
          )
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.multiply),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 19
                ),
                overflow: TextOverflow.ellipsis,
                /// what is the purpose of this??
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow[600],size: 18,),
                      const SizedBox(width: 7,),
                      Text(rating),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.schedule,
                      color: Colors.yellow,
                      size: 18,
                      ),
                      const SizedBox(width: 7,),
                      Text(cookTime),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
