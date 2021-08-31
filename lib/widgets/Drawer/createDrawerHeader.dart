import 'package:flutter/material.dart';

Widget createDrawerHeader() {
 return DrawerHeader(
     margin: EdgeInsets.zero,
     padding: EdgeInsets.all(15),
     decoration: BoxDecoration(
         image: DecorationImage(
             fit: BoxFit.none,
             image:  AssetImage('assets/images/logo.png'))),
     child: Stack(children: <Widget>[
       Positioned(
           bottom: 1.0,
           left: 8.0,
           child: Text("Leisure Lounge",
               style: TextStyle(
                   color: Colors.orangeAccent,
                   fontSize: 20.0,
                   fontWeight: FontWeight.w500))),
     ]));
}