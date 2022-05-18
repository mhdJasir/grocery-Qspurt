import 'package:flutter/material.dart';
import '../account/account_screen.dart';
import '../home/home_screen.dart';
import '../schedule.dart';
import '../service.dart';
import '../url1.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Home", "assets/icons/shop_icon.svg", 0, Home()),
  NavigatorItem("Service", "assets/icons/explore_icon.svg", 1, url1()),
  NavigatorItem("Schedule", "assets/icons/cart_icon.svg", 2, schedule()),
  NavigatorItem("Appointments", "assets/icons/favourite_icon.svg", 3, appointments()),
  NavigatorItem("Account", "assets/icons/account_icon.svg", 4, AccountScreen()),
];
