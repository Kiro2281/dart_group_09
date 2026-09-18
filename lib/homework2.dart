import 'package:flutter/material.dart';
import 'ProductCard2.dart';

void main() { runApp(MarketApp());}

class MarketApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Market'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding:EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Productcard2(
                      image: "images/BomuBomunoMi.jpg",
                      title: "Bomb fruit",
                      price: "\$185",
                      rating: 2,
                      category: "Rare",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Productcard2(
                      image: "images/Mira Mira no Mi.jpg",
                      title: "Flame fruit",
                      price: '\$200',
                      rating: 4,
                      category: "Common",
                      sale: true,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Productcard2(
                      image: "images/Dragon-Dragon Model Nidhogg.jpg",
                      title: "Dragon fruit",
                      price: "\$220",
                      rating: 3,
                      category: "Legendary",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Productcard2(
                      image: "images/Revive-Revive Fruit.jpg",
                      title: "Immortal fruit",
                      price: "\$500",
                      rating: 5,
                      category: "Mythic",
                    ),
                  ),
                ],
              ),
            ],
          ), 
        ),
      ),
    );
    
  }
}
