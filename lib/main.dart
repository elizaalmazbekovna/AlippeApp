import 'package:alippe_app/pages/alippe_meet.dart';
import 'package:alippe_app/pages/googlemeet_page.dart';
import 'package:alippe_app/pages/live_page.dart';
import 'package:alippe_app/pages/podcast_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          home: MainPage(),
          // routes: {
          //   '/meeting': (context) => AlippeMeet(),
          //   '/live': (context) => LivePage(
          //         meetingLink: '',
          //       ),
          //   '/googlemeet': (context) => GoogleMeetPage(
          //         link: '',
          //       ),
          // },
        );
      },
    );
  }
}
