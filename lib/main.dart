import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_api/screen/home/provider/provider_.dart';
import 'package:random_api/screen/home/view/view_ui.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Homeprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {

          '/': (context) => Homescreen(),
        },
      ),
    ),
  );
}

