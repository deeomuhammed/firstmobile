import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/userdetailscontroller.dart';
import 'package:userapp/view/tab1.dart';
import 'package:userapp/view/tab2.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
 void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    context.read<UserDetailsController>().userDetailsapicall();
  }
@override
  void dispose() {
 var provider = Provider.of<UserDetailsController>(context, listen: false);
 provider.bookmarkedcontroller.dispose();
 provider.userdetailscontroller.dispose();
tabController.dispose();

    super.dispose();
  }
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
      title: const Text('GITHUB USERS',style: TextStyle(fontSize: 24),),
          bottom:TabBar(controller:tabController ,tabs:const [ Tab(text: 'Users',), Tab(text: 'Bookmark',)]) ,),
        body: TabBarView(
        controller:tabController ,
        children:const [ UsersScreen(), BookmarkScreen()],
        // 
        ),
        
        ),
    );
  }
}