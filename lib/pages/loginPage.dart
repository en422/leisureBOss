import 'package:flutter/material.dart';
import 'package:offline/pages/header.dart';
import 'package:offline/widgets/datatables/dataTable_user.dart';
import 'package:offline/navigationDrawer/MenuController.dart';
import 'package:provider/provider.dart';


//this is the first page loaded when the site is opened it is a login page for the admin
class HomePage extends StatelessWidget {
 static const String routeName = '/loginPage';
 TextEditingController name = TextEditingController();

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
     key: context.read<MenuController>().scaffoldKey,
       appBar: PreferredSize(
         preferredSize: Size(MediaQuery.of(context).size.width, 50),
         child: Header(),
       ),
              body: DataTableWidget());
 }
}