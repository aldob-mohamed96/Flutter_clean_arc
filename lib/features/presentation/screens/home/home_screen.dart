import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../core/resources/export_file.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    log("Home page");
    return  Scaffold(
   
      appBar: AppBar(title:const Text(" Home "),),
      body: Column(children: [

        IconButton(icon:const Icon(Icons.add_moderator_outlined),onPressed: (){

                context.read<AuthenticationCubit>().updateAuthenticationLevel(AppAuthenticationLevel.unAuthenticated);

           },)

      ]),
    );
  }
}