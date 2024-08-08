import 'package:fintech_prototype/shared/components/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(15),
      body: Center(
          child: Column(
        children: [
          const Spacer(),
          Stack(children: [
            ClipOval(
              child: Image.asset(
                'assets/avatar_147133.png',
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                      onPressed: () {},
                    ))),
          ]),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Client Name',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const Text(
            'ClientName@gmail.com',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: 
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildProfileButton(action: (){}, icon:Icons.settings, text: 'Settings'),
                    const SizedBox(width: 20,),
                    buildProfileButton(action: (){}, icon:Icons.dark_mode, text: 'Theme'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildProfileButton(action: (){}, icon:Icons.support_agent_rounded, text: 'Contact Us'),
                    const SizedBox(width: 20,),
                    buildProfileButton(action: (){}, icon: Icons.logout, text: 'Logout',iconColor: Colors.red.withAlpha(200)),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      )),
    );
  }
}
