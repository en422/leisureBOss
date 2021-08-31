import 'package:flutter/material.dart';
import 'package:offline/navigationDrawer/navigationDrawer.dart';
import 'package:offline/pages/header.dart';
import 'package:offline/widgets/datatables/dataTable_user.dart';
import 'package:offline/navigationDrawer/MenuController.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
 static const String routeName = '/homePage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
     key: context.read<MenuController>().scaffoldKey,
       appBar: PreferredSize(
         preferredSize: Size(MediaQuery.of(context).size.width, 50),
         child: Header(),
       ),
       drawer: NavigationDrawer(),
              body: DataTableWidget()
  );
 }
}