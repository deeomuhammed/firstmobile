import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/userdetailscontroller.dart';
import 'package:userapp/view/tab1.dart';
import 'package:userapp/view/usertile.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
            builder: (context,UserDetailsController controller,_) {
              return  Container(
      child: Column(
        children: [
                 Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller:controller.bookmarkedcontroller,
              onChanged: ((value) {
                controller.bookmarkedserch();
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
            
            child: ListView.builder(itemCount:controller.bookmarkedserchedList.isEmpty?controller.bookmarkuser.length:controller.bookmarkedserchedList.length,
              itemBuilder: (ctx,index){
              
              return  controller.bookmarkedserchedList.isEmpty? UserTile(isserching: false, imge: controller.bookmarkuser[index].image!, name: controller.bookmarkuser[index].name!, bookmark: controller.bookmarkuser[index].bookmark, index: index,pagenum: 2,):UserTile(isserching: true, imge: controller.bookmarkedserchedList[index].image!, name: controller.bookmarkedserchedList[index].name!, bookmark: controller.bookmarkedserchedList[index].bookmark, index: index,pagenum: 2,);
            }),
          ),
        ],
      ),
    );});}
}