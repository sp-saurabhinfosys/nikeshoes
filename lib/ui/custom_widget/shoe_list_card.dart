import 'package:flutter/material.dart';

class MyShoeListCard extends StatelessWidget {
  final String modelNumber;
  final String shoeName;
  final String img;
  final VoidCallback onClick;
  final Color bgColor;
  final String originalPrice;
  final String dummyPrice;
  final String heroIndex;

  MyShoeListCard(
      {this.modelNumber,
      this.shoeName,
      this.img,
      this.onClick,
      this.bgColor,
      this.originalPrice,
      this.dummyPrice, this.heroIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: 380,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Container(
                height: 250,
                width: 500,
                //color: Colors.red,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 0,
                      child: Hero(
                        tag: "Text"+heroIndex,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            modelNumber,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black.withOpacity(
                                  0.05,
                                ),
                                height: 1,
                                fontSize: 150,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 30,
                      child: Hero(
                        tag: "Img"+heroIndex,
                        child: Image.network(
                          img,
                          width: MediaQuery.of(context).size.width * .6,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Text(
                shoeName,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border),
                    Column(
                      children: [
                        Text(
                          "\$$dummyPrice",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.red),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$$originalPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ],
                    ),
                    Icon(Icons.add_shopping_cart),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
