import 'package:dump_it/app/app.dart';
import 'package:dump_it/data/models/comment_model.dart';
import 'package:dump_it/ui/view_models/allcommunities_Vm.dart';
import 'package:dump_it/ui/view_models/comments_VM.dart';
import 'package:dump_it/ui/view_models/dumps_VM.dart';
import 'package:dump_it/ui/view_models/message_VM.dart';
import 'package:dump_it/ui/view_models/newpost_VM.dart';
import 'package:dump_it/ui/view_models/profile_VM.dart';
import 'package:dump_it/ui/view_models/splash_VM.dart';
import 'package:dump_it/ui/views/allcommunities_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context,orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SplashViewModel()),
            ChangeNotifierProvider(create: (_) => ProfileViewModel()),
            ChangeNotifierProvider(create: (_) => DumpsViewModel()),
            ChangeNotifierProvider(create: (_) => MessageViewModel()),
            ChangeNotifierProvider(create: (_) => NewPostViewModel()),
            ChangeNotifierProvider(create: (_) => AllCommunitiesViewModel()),
            ChangeNotifierProvider(create: (_) => CommentsVM()),
          ],
          child: const App(),
        );
      }
    ),
  );
}