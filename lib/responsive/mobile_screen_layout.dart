import 'package:flutter/material.dart';
import 'package:picogram/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../models/user.dart'as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Center(child: Text(user.userName)),
    );
  }
}
