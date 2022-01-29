import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_users.dart';
import 'package:flutter_social_ui/widgets/post_carolsel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: 2, vsync: this);
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text("Frenzy",
            style: TextStyle(
                letterSpacing: 10.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor)),
        bottom: TabBar(
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          controller: tabcontroller,
          tabs: [Text("Trending"), Text("Latest")],
        ),
      ),
      body: ListView(
        children: [
          FollowingUsers(users),
          PostCarosel(
            title: 'Posts',
            posts: posts,
            pageController: pageController,
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
