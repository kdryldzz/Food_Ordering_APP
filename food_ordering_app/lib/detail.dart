import 'package:flutter/material.dart';
import 'package:food_ordering_app/foods.dart';

class Detail extends StatefulWidget {
  final Foods yemek;

  const Detail({super.key, required this.yemek});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.yemek.food_name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset('images/${widget.yemek.food_image_name}'),
            SizedBox(
              height: 30,
            ),
            Text(
              "${widget.yemek.food_price} \u{20BA}",
              style: TextStyle(fontSize: 48, color: Colors.blue),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              child: Container(
                height: 70,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextButton(
                  onPressed: () {
                    print('${widget.yemek.food_name} ordered.');
                  },
                  child: Text(
                    'Order',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
