import 'package:flutter/material.dart';
import 'package:nikeshoes/ui/custom_widget/custom_animation.dart';
import 'package:nikeshoes/ui/screens/shoes_details.dart';
import 'package:nikeshoes/utils.dart';

class CustomBottomSheet extends StatefulWidget {
  final VoidCallback onclick;


  CustomBottomSheet({this.onclick});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  int selectedSize;
  AnimationController _controller;
  Animation _animation1;
  Animation _animationMoveDown;
  Animation _animationMoveOut;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    _animation1 = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.3)));
    _animationMoveDown = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.4, 0.5)));
    _animationMoveOut = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.6, 0.8,curve: Curves.easeInOutBack)));
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {

        setState(() {
          widget.onclick();
        /*  ShoesDetails(refreshScreen: (){
            ShoesDetails.isBottom = false;
            setState(() {

          });},);*/
        });
        print("Wow");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var sheetWidth = (size.width * _animation1.value).clamp(50.0, size.width);
    var sheetHeight =
        (size.height * .6 * _animation1.value).clamp(50.0, size.height * .6);
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              if(_animationMoveDown.value!=1)
              Positioned(
                top: size.height * .3+(_animationMoveDown.value*size.height * .46),
                left: size.width / 2 -
                    ((size.width * _animation1.value).clamp(60.0, size.width)) /
                        2,

                child: BottomShakeTransition(
                  child: Container(
                    width: /*500,*/ (size.width * _animation1.value)
                        .clamp(60.0, size.width),
                    height: (size.height * .6 * _animation1.value)
                        .clamp(60.0, size.height * .6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                          bottomLeft: _animation1.value == 1
                              ? Radius.circular(0)
                              : Radius.circular(30),
                          bottomRight: _animation1.value == 1
                              ? Radius.circular(0)
                              : Radius.circular(30),
                        )),
                    child: Padding(
                      padding: EdgeInsets.all(
                        (20 * _animation1.value).clamp(0.0, 20),
                      ),
                      child: Column(
                        mainAxisAlignment: _animation1.value == 1?MainAxisAlignment.start:MainAxisAlignment.center,

                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _animation1.value == 1?Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                Global.myShoesList[Global.selectedShoeIndex]
                                    .image,
                                width:
                                (150 * _animation1.value).clamp(40.0, 150),
                              ),

                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    Global
                                        .myShoesList[
                                    Global.selectedShoeIndex]
                                        .shoesName,
                                    style: TextStyle(
                                        color:
                                        Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "\$" +
                                        Global
                                            .myShoesList[
                                        Global.selectedShoeIndex]
                                            .originalPrice
                                            .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              )

                            ],
                          ):
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                Global.myShoesList[Global.selectedShoeIndex]
                                    .image,
                                width:
                                    (150 * _animation1.value).clamp(40.0, 150),
                              ),



                            ],
                          ),
                          if (_animation1.value == 1) ...[
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.bar_chart,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "    SELECT SIZE",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        children: List.generate(
                                            Global
                                                .myShoesList[
                                                    Global.selectedShoeIndex]
                                                .shoesSize
                                                .length, (index) {
                                          return selectedSize == index
                                              ? ActiveSizeCard(
                                                  shoeSize: Global
                                                      .myShoesList[Global
                                                          .selectedShoeIndex]
                                                      .shoesSize[index],
                                                  onClick: () {
                                                    selectedSize = index;
                                                    print(selectedSize);
                                                    setState(() {});
                                                  },
                                                )
                                              : InactiveSizeCard(
                                                  shoeSize: Global
                                                      .myShoesList[Global
                                                          .selectedShoeIndex]
                                                      .shoesSize[index],
                                                  onClick: () {
                                                    selectedSize = index;
                                                    print(selectedSize);
                                                    setState(() {});
                                                  },
                                                );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]

                          /*  FloatingActionButton.extended(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(500)
                          ),
                          onPressed: selectedSize==null?null:() {

                          },
                          backgroundColor: selectedSize==null?Colors.grey[300]:Colors.black,
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text("Add To Cart"),),*/
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: size.width/2 -((150 * _animation1.value).clamp(65.0, 150.0))/2 ,
                bottom: 20 - (_animationMoveOut.value*100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: () {
                          print("hii");
                          _controller.forward();
                          setState(() {});
                        },
                        child: Container(
                          height: 65,
                          width: (150 * _animation1.value).clamp(65.0, 150.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              ),
                              _animation1.value == 1
                                  ? Text(
                                      "     Add To Cart",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

// ignore: must_be_immutable
class ActiveSizeCard extends StatelessWidget {
  final String shoeSize;
  final VoidCallback onClick;

  ActiveSizeCard({
    this.shoeSize,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        child: Container(
          width: 65,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Center(
              child: Text(
            shoeSize,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class InactiveSizeCard extends StatelessWidget {
  final String shoeSize;
  final VoidCallback onClick;

  InactiveSizeCard({
    this.shoeSize,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          width: 65,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Center(
              child: Text(
            shoeSize,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )),
        ),
      ),
    );
  }
}
