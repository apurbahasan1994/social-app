import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  _buildDrawerOptions(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: () => onTap(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(currentUser.backgroundImageUrl),
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 10.0,
                left: 10.0,
                bottom: 10.0,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColor)),
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(currentUser.profileImageUrl),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
          _buildDrawerOptions(
              Icon(Icons.dashboard),
              "home",
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()))),
          _buildDrawerOptions(
              Icon(Icons.account_circle_outlined),
              "profile",
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProfileScreen(
                            user: currentUser,
                          )))),
        ],
      ),
    );
  }
}
