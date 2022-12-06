
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/userdetailscontroller.dart';
import 'package:userapp/view/KTextField.dart';
import 'package:userapp/view/usertile.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool _isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;


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
    return Consumer(
          builder: (context,UserDetailsController controller,_) {
            return  controller.users.isEmpty?Center(child: CircularProgressIndicator(),): Column(
              children: [
                  Padding(
          padding: const EdgeInsets.all(10),
          child: 
        KTextField(textcontroller: controller.userdetailscontroller) ),
         
                Expanded(
                  child: ListView.builder(
                      controller: _controller,
                    itemCount:controller.users.length ,
                        itemBuilder: (ctx,index){
                        
                        return 
                            Visibility(
                              visible:controller.users[index].name!.toLowerCase().contains(controller.userdetailscontroller.text.toLowerCase()) ,
                              child: Padding(
                                                  padding: const EdgeInsets.all(2),
                                                  child: UserTile( name:   controller.users[index].name.toString() ,imge:controller.users[index].image.toString() ,bookmark:controller.users[index].bookmark,index: index,)),
                            );
                     
                            }
                          
                        ),


                ),
                 isLoadMoreRunning?const  CircularProgressIndicator():Container(),
                SizedBox(height:   isLoadMoreRunning?20:0,)
              ],
            );
    });
  }
}

