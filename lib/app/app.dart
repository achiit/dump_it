import 'package:dump_it/app/app_theme.dart';
import 'package:dump_it/ui/views/auth/fill_details_view.dart';
import 'package:dump_it/ui/views/auth/fill_details_view2.dart';
import 'package:dump_it/ui/views/dumps_screens/dump_detail_view.dart';
import 'package:dump_it/ui/views/home_view.dart';
import 'package:dump_it/ui/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Your App Title',
          theme: appTheme(),
          home: SplashView(),
          routes: {
            '/home': (context) => const HomeView(),
            '/dumpdetail':(context) => const DumpDetail(),
            '/filldetails':(context) => const FillDetailsView(),
            '/filldetails2':(context) => const FillDetailsView2(),

          },
        );
      }
    );
  }
}