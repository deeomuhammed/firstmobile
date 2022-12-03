import 'package:flutter/material.dart';
import 'package:userapp/controller/service.dart';
import 'package:userapp/model/tileusermodel.dart';
import 'package:userapp/model/usemodel.dart';

class UserDetailsController extends ChangeNotifier{
  int gituserSince=98938623;
List<User> users=[];
List<User> bookmarkuser=[];

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
bookmarkfun(index,pagenumber){
  print(index);

    if(pagenumber==1){
for (var i = 0; i < users.length; i++) {


  if (index==i) {
  
users[i].bookmark= users[i].bookmark==true?false:true;
if (users[i].bookmark==true&&pagenumber==1) {
  bookmarkuser.add(users[i]);
}else if(users[i].bookmark==false&&pagenumber==1){
   bookmarkuser.remove(users[i]);


}
  }}
}
else{
   for (var j = 0; j < bookmarkuser.length; j++) {


    if (index==j) {
        bookmarkuser.remove(bookmarkuser[j]);   

    }
  
  }
}
print('contro');
  notifyListeners();
}



//all users filter
List<User> serchedList=[];
TextEditingController userdetailscontroller=TextEditingController();
serch(){
  serchedList=[];
  if(users.isEmpty){}else{
  users.forEach((element) {
    if(element.name!.toLowerCase().contains(userdetailscontroller.text.toLowerCase())){
    serchedList.add(element);
    };
  },);

}  notifyListeners();
}

//bookmarked users filter
List<User> bookmarkedserchedList=[];
TextEditingController bookmarkedcontroller=TextEditingController();
bookmarkedserch(){

  bookmarkedserchedList=[];
  if(bookmarkuser.isEmpty){}else{
  bookmarkuser.forEach((element) {
    if(element.name!.toLowerCase().contains(bookmarkedcontroller.text.toLowerCase())){
    bookmarkedserchedList.add(element);
    };
  },);

}  notifyListeners();
}

//pagination
loadmore(){
gituserSince=gituserSince+10;
  notifyListeners();
}

}