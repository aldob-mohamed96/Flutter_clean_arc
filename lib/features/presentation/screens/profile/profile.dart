import 'dart:developer';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Profile Screen");
    return Scaffold(
      appBar: AppBar(),
      body:const Center(child: Text("Profile Screen")),

    );
  }
}

