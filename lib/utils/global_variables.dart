import 'package:flutter/material.dart';
import 'package:picogram/screens/add_post_screen.dart';
import 'package:picogram/screens/feed_screen.dart';
import 'package:picogram/screens/search_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  // Text('Fav'),
  Text('Profile'),
];
