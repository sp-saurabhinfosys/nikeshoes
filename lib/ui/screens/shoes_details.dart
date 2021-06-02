import 'package:flutter/material.dart';
import 'package:nikeshoes/ui/custom_widget/custom_animation.dart';
import 'package:nikeshoes/ui/screens/bottom_sheet.dart';
import 'package:nikeshoes/utils.dart';

class ShoesDetails extends StatefulWidget {
  final VoidCallback refreshScreen;
  static String route = "ShoesDetails";
  static bool isBottom = false;

  ShoesDetails({this.refreshScreen});

  @override
  _ShoesDetailsState createState() => _ShoesDetailsState();
}

class _ShoesDetailsState extends State<ShoesDetails> {
  int pageIndex = 0;


  bool isAnimate = false;
  final GlobalKey<AnimatedListState> _globalKey =
      GlobalKey<AnimatedListState>();

  getIsAnimate() {
    isAnimate = true;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getIsAnimate();
    setState(() {});
    super.initState();
  }

  Tween<Offset> _offset = Tween(
      begin: Offset(1, 0),
      end: Offset(
        0,
        0,
      ));

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            isAnimate = !isAnimate;
            setState(() {});
          },
          child: Image.network(
            "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png",
            height: 25,
          ),
        ),
      ),
      body: Stack(

        children: [
          Column(
            children: [
              Container(
                height: 400,
                width: 500,
                color: Global.myShoesList[Global.selectedShoeIndex].bgColor,
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 0,
                            child: Hero(
                              tag: "Text" + Global.heroIndex,
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  Global.myShoesList[Global.selectedShoeIndex]
                                      .modelNumber,
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
                              tag: "Img" + Global.heroIndex,
                              child: PageView.builder(
                                  onPageChanged: (x) {
                                    pageIndex = x;
                                    setState(() {});
                                  },
                                  itemCount: Global
                                      .myShoesList[Global.selectedShoeIndex]
                                      .imageList
                                      .length,
                                  itemBuilder: (c, i) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Image.network(
                                        Global
                                            .myShoesList[
                                                Global.selectedShoeIndex]
                                            .imageList[i],
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          Global.myShoesList[Global.selectedShoeIndex].imageList
                              .length, (index) {
                        if (pageIndex == index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Container(
                              height: 4,
                              width: 4,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Container(
                              height: 4,
                              width: 4,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(.5)),
                            ),
                          );
                        }
                      }),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  //color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: ShakeTransition(
                                      child: Text(
                                Global.myShoesList[Global.selectedShoeIndex]
                                    .shoesName,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ))),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ShakeTransition(
                                      child: Text(
                                    "\$" +
                                        Global
                                            .myShoesList[
                                                Global.selectedShoeIndex]
                                            .dummyPrice
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red),
                                  )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ShakeTransition(
                                      child: Text(
                                    "\$" +
                                        Global
                                            .myShoesList[
                                                Global.selectedShoeIndex]
                                            .originalPrice
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ShakeTransition(
                              child: Text(
                            "AVAILABLE SIZES",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          ShakeTransition(
                              child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,

                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                Global.myShoesList[Global.selectedShoeIndex]
                                    .shoesSize.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  Global.myShoesList[Global.selectedShoeIndex]
                                      .shoesSize[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          ShakeTransition(
                              child: Text(
                            "DESCRIPTION",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          ShakeTransition(
                              child: Text(
                            Global.myShoesList[Global.selectedShoeIndex]
                                    .description +
                                " abc\n\n\n\n\n\n\n\nd",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: BottomShakeTransition(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      heroTag: "F1",
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        ShoesDetails.isBottom = true;
                        setState(() {});
                      },
                      heroTag: "F2",
                    ),
                  ],
                ),
              ),
            ),
          ),
          ShoesDetails.isBottom? GestureDetector(
            onTap: (){
              ShoesDetails.isBottom =false;
              setState(() {

              });
            },
              child: Container(color: Colors.black87,)):Container(),
          ShoesDetails.isBottom ?    CustomBottomSheet(onclick: (){
             ShoesDetails.isBottom =false;
            setState(() {

          });},) : Container(),
        ],
      ),
    );
  }
}
