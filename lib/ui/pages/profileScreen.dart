import 'package:eco_commerce_app/core/data/sharedPrefHandler.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/globals.dart' as globals;
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Widget> orders;

  @override
  void initState() {
    super.initState();
    orders = new List();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                  stretch: true,
                  backgroundColor: Colors.white,
                  excludeHeaderSemantics: true,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                    icon: Icon(LineAwesomeIcons.arrow_left),
                  ),
                  actions: <Widget>[
                    IconButton(
                      onPressed: () {
                        print("Wishlist");
                      },
                      color: Colors.black,
                      icon: Icon(LineAwesomeIcons.bookmark),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        removeValue('jwt');
                        removeValue('id');
                        removeValue('confirmed');
                        removeValue('blocked');
                        removeValue('username');
                        removeValue('email');
                        removeValue('organisation');
                        removeValue('orgemail');
                        removeValue('phone');
                        removeValue('createdAt');
                        Navigator.pushReplacementNamed(context, LoginRoute);
                      },
                      color: Colors.black,
                      icon: Icon(LineAwesomeIcons.sign_out),
                    ),
                  ],
                  pinned: true,
                  floating: false,
                  elevation: 0,
                  expandedHeight: MediaQuery.of(context).size.height * (2 / 5),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    titlePadding: EdgeInsets.fromLTRB(60, 0, 0, 13),
                    background: ProfileFlexibleAppBar(),
                    title: Container(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Your Orders",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20,
                              color: Color(0xff464646)),
                        )),
                  )),
              SliverList(delegate: SliverChildListDelegate(orders)),
            ],
          ),
          // Positioned(
          //     left: MediaQuery.of(context).size.width / 2 - 120,
          //     right: MediaQuery.of(context).size.width / 2 - 120,
          //     bottom: 100,
          //     child: Container(
          //       height: 40,
          //       child: RaisedButton(
          //         onPressed: () {
          //           print("WishList");
          //         },
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10)),
          //         child: Text(
          //           "Your WishList",
          //           style: TextStyle(
          //               fontFamily: "Poppins",
          //               fontSize: 24,
          //               color: Colors.white),
          //         ),
          //         color: Color(0xff004445),
          //       ),
          //     )),
          // Positioned(
          //     left: MediaQuery.of(context).size.width / 2 - 90,
          //     right: MediaQuery.of(context).size.width / 2 - 90,
          //     bottom: 20,
          //     child: Container(
          //       height: 40,
          //       child: RaisedButton(
          //         onPressed: () {
          //           print("Sign Out");
          //         },
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10)),
          //         child: Text(
          //           "SIGN OUT",
          //           style: TextStyle(
          //               fontFamily: "Poppins",
          //               fontSize: 24,
          //               color: Colors.white),
          //         ),
          //         color: Color(0xff004445),
          //       ),
          //     )),
        ],
      ),
    );
  }

  void getOrders() {
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
    orders.add(ProductListTile());
  }
}

class ProfileFlexibleAppBar extends StatefulWidget {
  const ProfileFlexibleAppBar();

  @override
  _ProfileFlexibleAppBarState createState() => _ProfileFlexibleAppBarState();
}

class _ProfileFlexibleAppBarState extends State<ProfileFlexibleAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 0, right: 50, bottom: 4),
                      child: Text(
                        globals.currentUser.username,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 40,
                            color: Color(0xff464646)),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        globals.currentUser.email,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            color: Color(0xff464646)),
                      )),
                  globals.currentUser.phone == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            globals.currentUser.phone,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 24,
                                color: Color(0xff464646)),
                          )),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        globals.currentUser.organisation,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            color: Color(0xff464646)),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        globals.currentUser.orgemail,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            color: Color(0xff464646)),
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFC4C4C4),
                        child: Text(
                          globals.getInitials(globals.currentUser.username),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFE0E0E0),
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      print("Edit");
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            color: Color(0xff464646)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}