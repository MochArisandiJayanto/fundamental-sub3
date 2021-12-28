import 'package:flutter/material.dart';
import '../../model/restaurant_model.dart';
import '../detail/detailpage.dart';

class RestaurantItem extends StatelessWidget{
  final Restaurant? restaurant;
  const RestaurantItem({this.restaurant});

  String getImage(id) {
    return "https://restaurant-api.dicoding.dev/images/small/$id";
  }

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () => Navigator.pushNamed(context, DetailPage.route,
          arguments: restaurant!.id),
      child: Card(
        color: Colors.teal[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                  child: Image.network(getImage(restaurant!.pictureId.toString())),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 5,),
                      Text(
                        restaurant!.name.toString(),
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.location_on, color: Colors.blue,),
                          Text(
                            restaurant!.city.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.star, color: Colors.yellow,),
                          Text(
                            restaurant!.rating.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}