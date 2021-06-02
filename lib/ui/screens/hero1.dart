import 'package:flutter/material.dart';
import 'package:nikeshoes/ui/screens/hero2.dart';

class H1 extends StatefulWidget {
  static String route = "H1";
  @override
  _H1State createState() => _H1State();
}

class _H1State extends State<H1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(H2.route);
        },
        child: Center(
          child: Container(
            color: Colors.red.shade100,
              child: Column(
                children: [
                  Hero(
                      tag: "HHH",child: Image.network("https://freepngimg.com/thumb/shoes/28530-3-nike-shoes-transparent.png",height: 250,width: 250,)),
                  Text("bhai bhai")
                ],
              )),
        ),
      ),
    );
  }
}
