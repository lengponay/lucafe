// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'package:western/pages/account/edit_profile.dart';
import '../accountWidget/forwardButton.dart';
import '../accountWidget/settingItem.dart';
import '../accountWidget/setting_switch.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;
  String userInputFname = 'Manika';
  String userInputLname = 'Rous';
  String userInputAge = '26';
  String userInputEmail = 'manikaRous@gmail.com';
  String userInputContact = '086928053';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:  [Color.fromARGB(255, 74, 140, 215), Color.fromARGB(255, 217, 222, 222)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
        ),
       
          child: Padding(
            padding: const EdgeInsets.only(top : 70, right : 30, left : 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.profile,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/notification");
                      },
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  AppLocalizations.of(context)!.account,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                          "lib/images/profile.jpg",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ("$userInputFname $userInputLname"),
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.editProfile,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ForwardButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            ),
                          );
                        },
                      ), //// icon button to somewhere
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  AppLocalizations.of(context)!.setting,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: AppLocalizations.of(context)!.language,
                  bgColor: Colors.orange.shade100,
                  iconColor: Colors.orange,
                  icon: Ionicons.language,
                  value: " ",
                  // value:  "English",
                  onTap: () {
                    Navigator.pushNamed(context, "/languages");
                  },
                ),
                const SizedBox(height: 20),
                SettingSwitch(
                  title: AppLocalizations.of(context)!.notifications,
                  bgColor: Colors.green.shade100,
                  iconColor: Colors.green,
                  icon: Ionicons.notifications,
                  value: isDarkMode,
                  onTap: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: AppLocalizations.of(context)!.password,
                  bgColor: Colors.blue.shade100,
                  iconColor: Colors.blue,
                  icon: Ionicons.key,
                  onTap: () {
                    Navigator.pushNamed(context, "/changePw");
                  },
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: AppLocalizations.of(context)!.deleteAccount,
                  bgColor: Colors.red.shade100,
                  iconColor: Colors.red,
                  icon: Ionicons.trash_bin,
                  onTap: () {
                    Navigator.pushNamed(context, "/changePw");
                  },
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: AppLocalizations.of(context)!.logOut,
                  bgColor: Colors.grey.shade100,
                  iconColor: Colors.grey,
                  icon: Ionicons.log_out,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Color.fromARGB(255, 34, 113, 178),
                            // insetPadding: EdgeInsets.only(top: 20),
                            title: Text(
                              AppLocalizations.of(context)!.logOut,
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            content: Text(
                              AppLocalizations.of(context)!.areYouSureToLogOut,
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.cancel,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/");
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.logOut,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    
  }
}
