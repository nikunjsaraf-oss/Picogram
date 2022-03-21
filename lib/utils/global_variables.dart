import 'package:flutter/material.dart';
import 'package:picogram/screens/add_post_screen.dart';
import 'package:picogram/screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Text('Search'),
  AddPostScreen(),
  // Text('Fav'),
  Text('Profile'),
];
