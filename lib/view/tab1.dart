import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/userdetailscontroller.dart';
import 'package:userapp/view/prodect.dart';
import 'package:userapp/view/usertile.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool _isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;
  //   void _firstLoad() async {
  //   setState(() {
  //     _isFirstLoadRunning = true;
  //   });
  //   try {
  //     var provider = Provider.of<UserDetailsController>(context, listen: false);
  //     provider. userDetailsapicall();
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print('Something went wrong');
  //     }
  //   }

  //   setState(() {


  //     _isFirstLoadRunning = false;


  //   });
  // }

  void _loadMore() async {
    if (_isFirstLoadRunning == false && isLoadMoreRunning == false) {
      var provider = Provider.of<UserDetailsController>(context, listen: false);
      provider.loadmore();
      setState(() {
        isLoadMoreRunning = true;
      });

      try {
        await provider.userDetailsapicall();
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView


  @override
  void initState() {
    super.initState();
    // _firstLoad();
    _controller = ScrollController();
    _controller.addListener((() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent) {
        
          _loadMore();
        
      }
    }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  late ScrollController _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer(
            builder: (context,UserDetailsController controller,_) {
              return  controller.users.isEmpty?Center(child: CircularProgressIndicator(),): Column(
                children: [
                    Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller:controller.userdetailscontroller,
              onChanged: ((value) {
                controller.serch();
              }),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Search Users",
                  prefixIcon: Padding(
                    padding:
                         EdgeInsets.symmetric(vertical: 16 * 0.75),
                    child: SvgPicture.asset(
                      "assets/Search.svg",
                      height: 24,
                      width: 24,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.3),
                    ),
                  ),
                ),
              ),
          ),
           
                  Expanded(
                    child: ListView.builder(
                        controller: _controller,
                      itemCount: controller.serchedList.isEmpty?controller.users.length:controller.serchedList.length ,
                          itemBuilder: (ctx,index){
                          
                          return 
                              Padding(
                      padding: const EdgeInsets.all(2),
                      child:controller.serchedList.isEmpty?  UserTile( isserching: false, name:   controller.users[index].name.toString() ,imge:controller.users[index].image.toString() ,bookmark:controller.users[index].bookmark,index: index,pagenum: 1,): UserTile(isserching: true, name:   controller.serchedList[index].name.toString() ,imge:controller.serchedList[index].image.toString() ,bookmark:controller.serchedList[index].bookmark,index: index,pagenum: 1,));
                       
                              }
                            
                          ),


                  ),
                   isLoadMoreRunning? CircularProgressIndicator():Container(),
                  SizedBox(height:   isLoadMoreRunning?20:0,)
                ],
              );
      }),
    );
  }
}

