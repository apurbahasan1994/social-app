import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/post_carolsel.dart';
import 'package:flutter_social_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _postPageController;
  late PageController _favPageController;
  @override
  void initState() {
    super.initState();
    _favPageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _postPageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl),
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    )),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 3.0, color: Theme.of(context).primaryColor)),
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.user.profileImageUrl),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text(
              widget.user.name,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "following",
                      style: TextStyle(color: Colors.black54, fontSize: 22.0),
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.0,
                ),
                Column(
                  children: [
                    Text(
                      "followers",
                      style: TextStyle(color: Colors.black54, fontSize: 22.0),
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
            PostCarosel(
                pageController: _postPageController,
                posts: widget.user.posts,
                title: "Posts"),
            SizedBox(height: 6.0),
            PostCarosel(
                pageController: _favPageController,
                posts: widget.user.favorites,
                title: "Fav posts")
          ],
        ),
      ),
    );
  }
}
