import 'package:flutter/material.dart';
import 'package:offline/navigationDrawer/navigationDrawer.dart';
import 'package:provider/provider.dart';
import 'package:offline/navigationDrawer/MenuController.dart';
import 'package:offline/pages/header.dart';
import 'package:offline/widgets/datatables/dataTable_content.dart';

//this is the page loaded when content is triggered from the drawer
class Content extends StatelessWidget {
 static const String routeName = '/contentpage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
          key: context.read<MenuController>().scaffoldKey,
          
          
       appBar: PreferredSize(
         preferredSize: Size(MediaQuery.of(context).size.width, 70),
         child: Header()
       ),
       drawer: NavigationDrawer(),
       body: DataTableWidget());
 }
}