
import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';



class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child:  Text(AppStrings.noRouteFound.tr(context)),),
    );
  }
}

