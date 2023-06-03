import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("on borading page");
    return Scaffold(
       appBar: AppBar(

       ),
       body:Column(
         children: [
           const Center(child: Text("sadsadsadddddddddddddd"),),

           IconButton(icon:const Icon(Icons.add_moderator_outlined),onPressed: (){

                context.read<AuthenticationCubit>().updateAuthenticationLevel(AppAuthenticationLevel.authenticated);

           },)
         ],
       ),
    );
  }
}
