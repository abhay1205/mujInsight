import 'dart:convert';

import 'package:flutter/material.dart';


enum ProfileBtn { profile, logout, help, rateus }
 

class ProfileMenu extends StatefulWidget {
  @override
  _ProfileMenuState createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {

  
  
  ProfileBtn _selection;

  

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ProfileBtn>(
      icon: Icon(Icons.person_outline),
      onSelected: (ProfileBtn result) {
        setState(() {
          _selection = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ProfileBtn>>[
        const PopupMenuItem<ProfileBtn>(
          value: ProfileBtn.profile,
          child: Text('Profile'),
        ),
        const PopupMenuItem<ProfileBtn>(
          value: ProfileBtn.logout,
          child: Text('Log Out'),
        ),
        const PopupMenuItem<ProfileBtn>(
          value: ProfileBtn.help,
          child: Text('Help'),
        ),
        const PopupMenuItem<ProfileBtn>(
          value: ProfileBtn.rateus,
          child: Text('Rate us'),
        ),
      ],
    );
  }
}
