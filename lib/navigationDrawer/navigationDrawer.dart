import 'package:flutter/material.dart';
import 'package:offline/widgets/Drawer/createDrawerBodyItem.dart';
import 'package:offline/widgets/Drawer/createDrawerHeader.dart';
import 'package:offline/routes/pageRoute.dart';

class NavigationDrawer extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: <Widget>[
         createDrawerHeader(
         ),
         createDrawerBodyItem(
           icon: Icons.person,
           text: 'Users',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.user),
         ),
         createDrawerBodyItem(
           icon: Icons.file_present,
           text: 'Contents',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.content),
         ),
         createDrawerBodyItem(
           icon: Icons.upload_file,
           text: 'Upload',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.load),
         ),
         
         createDrawerBodyItem(
           icon: Icons.logout, 
           text: 'Logout', 
           onTap: () => 
              Navigator.pushReplacementNamed(context, PageRoutes.login),
          ),
         
       ],
     ),
   );
 }
}