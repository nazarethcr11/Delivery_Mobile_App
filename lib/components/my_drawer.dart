import 'package:app_delivery/components/my_drawer_tile.dart';
import 'package:flutter/material.dart';

import '../pages/settings_page.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logout() async{
    //get the auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(padding: const EdgeInsets.only(top:80),
            child: Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //home list tile
          MyDrawerTile(
            text: 'H o m e',
            icon: Icons.home,
            onTap: ()=>Navigator.pop(context),
          ),
          //settings list tile
          MyDrawerTile(
            text: 'S e t t i n g s',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Spacer(),
          //logout list tile
          MyDrawerTile(
            text: 'L o g o u t',
            icon: Icons.logout,
            onTap: () {
              logout();
            },
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}