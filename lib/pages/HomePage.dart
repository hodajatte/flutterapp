import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:grocerapp/widgets/BottomCartSheet.dart';

import 'package:grocerapp/widgets/CategoriesWidget.dart';
import 'package:grocerapp/widgets/DrawerWidget.dart';
import 'package:grocerapp/widgets/ItemsWidget.dart';
import 'package:grocerapp/widgets/PopularItemsWidget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold

      backgroundColor: Color(0xFF00A368),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Custom App Bar
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon:
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                   
                      onPressed: () {
                        // Open the drawer when the menu icon is clicked
                        _scaffoldKey.currentState?.openDrawer();
                      },
              
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF00A368),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: badges.Badge(
                        position: badges.BadgePosition.topEnd(),
                        badgeContent: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            showSlidingBottomSheet(
                              context,
                               builder: (context){
                                return SlidingSheetDialog(
                                  elevation: 8,
                                  cornerRadius: 16,
                                  builder: (context,state){
                                    return BottomCartSheet();
                        
                                  }
                                );
                           
                               }, );

                          },
                          child: Container(
                            padding: EdgeInsets.all(7),
                            child: Icon(
                              CupertinoIcons.cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Welcome Text
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal:15 ),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                     style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                 Text(
                  "What do you want to By?",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                 )

                  ],
                ),
            
          ),


          //Search Widget
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [Icon(Icons.search),
              Container(
                margin: EdgeInsets.only(left:10 ),
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    border: InputBorder.none
                  ),

                ),
              ),
              Spacer(),
              Icon(Icons.filter_list),
              ],
            ),
          ),
     //products Widgets
     Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesWidget(),
          PopularItemsWidget(),
          ItemsWidget(),
         
         ],
      ),
     ),
            ],
        ),
      ),
    ),
    drawer: DrawerWidget(),
    );

  }
}

