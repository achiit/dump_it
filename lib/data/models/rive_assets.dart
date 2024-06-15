import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<dynamic> bottomNavs = [
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "HOME", stateMachineName: "HOME_interactivity", title: "Home"),
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  Icon(Icons.add),
  RiveAsset(
    "assets/rive_assets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile"),
  // RiveAsset("assets/RiveAssets/icons.riv",
  //     artboard: "",
  //     stateMachineName: "_Interactivity",
  //     title: "Profile"),
];
