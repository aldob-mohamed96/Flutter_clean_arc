
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/resources/strings_manager.dart';


class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: const Text(AppStrings.noRouteFound).tr(),),
    );
  }
}

