import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    log("login page");
    return  Scaffold(
      appBar: AppBar(title:const Text(" Login "),),
      body: Column(children: [

        IconButton(icon:const Icon(Icons.add_moderator_outlined),onPressed: (){

          context.read<AuthenticationCubit>().updateAuthenticationLevel(AppAuthenticationLevel.authenticated);
           },)

      ]),
    );
  }
}