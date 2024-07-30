import 'package:alippe_app/screens/dashboard_screen.dart';
import 'package:alippe_app/secrets.dart';
import 'package:alippe_app/utils/calendar_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Handle platform-specific system UI settings
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  // Initialize Firebase
  await Firebase.initializeApp();

  // Set up Google Calendar API client
  var clientID = ClientId(Secret.getId(), "");
  const List<String> scopes = [cal.CalendarApi.calendarScope];

  try {
    final AuthClient client =
        await clientViaUserConsent(clientID, scopes, prompt);
    CalendarClient.calendar = cal.CalendarApi(client);
  } catch (e) {
    // Handle the error, e.g., log it or show an error message
    print('Error initializing Google Calendar API client: $e');
  }

  runApp(MyApp());
}

// Function to prompt the user for consent to access their Google Calendar
void prompt(String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    // Handle URL launching error, e.g., show an error message
    print('Error launching URL: $e');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home: DashboardScreen(),
    );
  }
}
