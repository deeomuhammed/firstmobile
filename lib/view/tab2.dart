import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/userdetailscontroller.dart';
import 'package:userapp/view/KTextField.dart';
import 'package:userapp/view/usertile.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
            builder: (context,UserDetailsController controller,_) {
              return  Column(
                children: [
                         Padding(
                    padding: const EdgeInsets.all(10),
                    child: KTextField(textcontroller: controller.bookmarkedcontroller)
                  ),
                   
                  Expanded(
                    
                    child: ListView.builder(itemCount:controller.users.length,
                      itemBuilder: (ctx,index){
                      
                      return  controller.users[index].bookmark==true ? Visibility(visible:controller.users[index].name!.toLowerCase().contains(controller.bookmarkedcontroller.text.toLowerCase()) , 
                        child: UserTile( imge: controller.users[index].image!, name: controller.users[index].name!, bookmark: controller.users[index].bookmark, index: index,)):Container();
                    }),
                  ),
                ],
              );});}
}