import 'package:flutter/material.dart';

class H2 extends StatefulWidget {
  static String route = "H2";
  @override
  _H2State createState() => _H2State();
}

class _H2State extends State<H2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Center(
          child: Container(
            color: Colors.red.shade100,
            child: Column(
                children: [
                  Hero(
                      tag: "HHH",
                      child: Image.network("https://freepngimg.com/thumb/shoes/28530-3-nike-shoes-transparent.png",width: 100,height: 100,)),
                  Text("herro")
                ],
              ),
          ),
        ),
      ),
    );
  }
}
