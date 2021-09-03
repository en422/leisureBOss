import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:offline/pages/loginPage.dart';
//import 'package:offline/widgets/datePicker/date_picker_widget.dart';
//import 'package:offline/widgets/datePicker/filePicker.dart';
import 'package:offline/widgets/datePicker/upload_provider.dart';
import 'package:offline/widgets/login_text.dart';
import 'package:offline/pages/uploadPage.dart';
import 'package:offline/pages/userPage.dart';
import 'package:offline/pages/contentPage.dart';
import 'package:offline/routes/pageRoute.dart';
import 'package:provider/provider.dart';
import 'package:offline/navigationDrawer/MenuController.dart';
import './utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
        ChangeNotifierProvider(
                        create: (context) => UploadDetail(),
                      )
      ],
      child: new MaterialApp(
        title: 'Leisure',
        theme: ThemeData.dark().copyWith(
          //scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          //canvasColor: secondaryColor,
        ),
        home: UserPage(),
        routes: {
          //page routes for the drawer items
          PageRoutes.user: (context) => UserPage(),
          PageRoutes.content: (context) => Content(),
          PageRoutes.load: (context) => Upload(),
          PageRoutes.login: (context) => Login(),
        },
      ),
    );
  }
}
