import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/userdetailscontroller.dart';

class UserTile extends StatelessWidget {
   UserTile({required this.imge,required this.name,required this.bookmark,required this.index,required this.pagenum, required this.isserching});
String name;
String  imge;
bool ?bookmark;
int index;
int pagenum;
bool ?isserching;
  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(title: Text(name),leading:CircleAvatar(
    backgroundColor: Colors.transparent,
    child: SizedBox(
      width: 60,
      height: 60,
      child: ClipOval(
        child: Image.network(imge)
      ),
    )
) ,trailing: Bookmarkwidget(icon: bookmark==true? Icons.bookmark:Icons.bookmark_outline ,index:index ,pagenum: pagenum,) ));
  }
}

class Bookmarkwidget extends StatelessWidget {
   Bookmarkwidget({required  this.icon,required this.index,required this.pagenum});
IconData icon;
int index;
int pagenum;
  @override
  Widget build(BuildContext context) {
    return Consumer(
            builder: (context,UserDetailsController controller,_) {
              return  IconButton(onPressed: () {
      controller.bookmarkfun(index,pagenum);
      print('hu');
    },icon:Icon( icon));});
  }
}

