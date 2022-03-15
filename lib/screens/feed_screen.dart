import 'package:flutter/material.dart';
import 'package:picogram/utils/colors.dart';
import 'package:picogram/widgets/app_logo.dart';
import 'package:picogram/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: true,
        title: const AppLogo(
          fontSize: 25,
        ),
      ),
      body: const PostCard(),
    );
  }
}
