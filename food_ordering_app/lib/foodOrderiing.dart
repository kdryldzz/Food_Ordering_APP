import 'package:flutter/material.dart';
import 'package:food_ordering_app/detail.dart';
import 'package:food_ordering_app/foods.dart';

class Foodorderiing extends StatefulWidget {
  const Foodorderiing({super.key});

  @override
  State<Foodorderiing> createState() => _FoodorderiingState();
}

class _FoodorderiingState extends State<Foodorderiing> {
  Future<List<Foods>> bringFoods() async {
    var foodList = <Foods>[];
    var y0 = Foods(
        food_id: 0,
        food_name: 'Pizza',
        food_price: 69.99,
        food_image_name: 'pizza.png');
    var y1 = Foods(
        food_id: 1,
        food_name: 'Köfte',
        food_price: 89.99,
        food_image_name: 'kofte.png');
    var y2 = Foods(
        food_id: 2,
        food_name: 'Ayran',
        food_price: 10,
        food_image_name: 'ayran.png');
    var y3 = Foods(
        food_id: 3,
        food_name: 'Fanta',
        food_price: 25,
        food_image_name: 'fanta.png');
    var y4 = Foods(
        food_id: 4,
        food_name: 'Kadayif',
        food_price: 45,
        food_image_name: 'kadayif.png');
    var y5 = Foods(
        food_id: 5,
        food_name: 'Baklava',
        food_price: 55,
        food_image_name: 'baklava.png');
    var y6 = Foods(
        food_id: 6,
        food_name: 'Makarna',
        food_price: 59.99,
        food_image_name: 'makarna.png');
    foodList.add(y0);
    foodList.add(y1);
    foodList.add(y2);
    foodList.add(y3);
    foodList.add(y4);
    foodList.add(y5);
    foodList.add(y6);

    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Foods>>(
          future: bringFoods(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var foodList = snapshot.data;
              return ListView.builder(
                itemCount: foodList?.length,
                itemBuilder: (context, index) {
                  var yemek = foodList?[index];
                  return Card(
                    child: Row(
                      children: [
                        SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset(
                                "images/${yemek?.food_image_name}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              yemek!.food_name,
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "${yemek.food_price} \u{20BA}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail(
                                            yemek: foodList![index],
                                          )));
                            },
                            icon: Icon(Icons.arrow_right))
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          }),
    );
  }
}
