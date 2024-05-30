import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'changePw.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF50C9C3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              title: const Text(
                "PROFILE",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  // COLUMN THAT WILL CONTAIN THE PROFILE
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Oliva",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text
                    ],
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(height: 35),
                  ...List.generate(
                    customListTiles.length,
                    (index) {
                      final tile = customListTiles[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.black12,
                          child: ListTile(
                            leading: Icon(tile.icon),
                            title: Text(tile.title),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              if (tile.onTap != null) {
                                tile.onTap!(context);
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  final Function(BuildContext)? onTap;
  CustomListTile({
    required this.icon,
    required this.title,
    this.onTap,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.person_2_outlined,
    title: "Edit Name",
  ),
  CustomListTile(
    icon: Icons.email_outlined,
    title: "Email",
  ),
  CustomListTile(
    title: "Change Password",
    icon: Icons.password,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChangePassword()),
      );
    },
  ),
  CustomListTile(
    icon: Icons.insights,
    title: "Activity",
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
  ),
  CustomListTile(
    title: "Logout",
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];
