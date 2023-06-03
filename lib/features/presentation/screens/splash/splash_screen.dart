import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("on splash page");
    return Scaffold(
      appBar: AppBar(),
      body:const Center(child: Text("sdfsdfdsfdsfdsf sdf;lsdf;l sdl;fsdl;f sdfsdfdsfsdf")),

    );
  }
}

