import 'package:offline/navigationDrawer/MenuController.dart';
import 'package:offline/navigationDrawer/responsive.dart';
import 'package:flutter/material.dart';
import 'package:offline/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//the header is always called by all the pages it includes the drawer button and search bar
class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "WELCOME",
            style: Theme.of(context).textTheme.headline6,
          ),
          
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        //ProfileCard()
      ],
    );
  }
}

/*class ProfileCard extends StatelessWidget {
   ProfileCard({
    Key? key,
  }) : super(key: key);

  String dropdownvalue = 'Admin';
  var items =  ['Admin','Logout'];
  var icon = [Icon(Icons.admin_panel_settings),Icon(Icons.logout)];


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
     decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Row(
        children: [
         DropdownButton(
                value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items:items.map((String items) {
                       return DropdownMenuItem(
                           value: items,
                           child: Text(items)
                       );
                  }
                  ).toList(),
                onChanged: (newValue){
                  setState(() {
                    newValue = dropdownvalue;
                  });
                },
              ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}*/

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
