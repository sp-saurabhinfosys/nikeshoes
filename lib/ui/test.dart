import 'package:flutter/material.dart';
import 'package:nikeshoes/model/model_shoes.dart';
import 'package:nikeshoes/ui/custom_widget/shoe_list_card.dart';
import 'package:nikeshoes/ui/screens/shoes_details.dart';
import 'package:nikeshoes/utils.dart';

class MyList extends StatefulWidget {
  static String route = "MyList";

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: Global.myShoesList.length,
          itemBuilder: (c, i) {
            return MyShoeListCard(
              onClick: () {
                Global.selectedShoeIndex = i;
                Global.heroIndex = i.toString();
               Navigator.of(context).pushNamed(ShoesDetails.route);
              },
              img: Global.myShoesList[i].image,
              bgColor: Global.myShoesList[i].bgColor,
              modelNumber: Global.myShoesList[i].modelNumber,
              shoeName: Global.myShoesList[i].shoesName,
              dummyPrice: Global.myShoesList[i].dummyPrice.toString(),
              originalPrice: Global.myShoesList[i].originalPrice.toString(),
              heroIndex: i.toString(),
            );
          }),
    );
  }
}

