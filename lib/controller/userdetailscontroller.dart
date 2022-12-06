import 'package:flutter/material.dart';
import 'package:userapp/controller/service.dart';
import 'package:userapp/model/tileusermodel.dart';
import 'package:userapp/model/usemodel.dart';
import 'package:userapp/view/usertile.dart';

class UserDetailsController extends ChangeNotifier{

int gituserSince=98938623;
List<User> users=[];
List<User> bookmarkuser=[];
TextEditingController bookmarkedcontroller=TextEditingController();
TextEditingController userdetailscontroller=TextEditingController();

//webservice call
  userDetailsapicall()async{
List<Usersmodel> ?usersmodel=await getUserData(gituserSince);
if(usersmodel!=null){
for (var element in usersmodel) {
  users.add( User(name: element.login, image:element.avatarUrl , bookmark: false,id: element.id));
}}

    notifyListeners();
  }

  //bookmarkfunction
bookmarkfun(index){
  print(index);

  
for (var i = 0; i < users.length; i++) {


  if ( users[index].id == users[i].id ) {
  
users[i].bookmark= users[i].bookmark==true?false:true;

  }}

  notifyListeners();
}





build(){

  if(users.isEmpty){}else{
  

}  notifyListeners();
}


//pagination
loadmore(){
gituserSince=gituserSince+10;
  notifyListeners();
}

}