
import 'package:erpapay/helpers/firestoreServices.dart';
import 'package:erpapay/screens/homeScreen.dart';
import 'package:erpapay/screens/loginScreen.dart';
import 'package:erpapay/screens/signInSteps/getEmailandPassword.dart';
import 'package:erpapay/screens/signInSteps/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:erpapay/helpers/AuthenticationServices.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
        StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        ),
        Provider<firestoreService>(
          create: (_) => firestoreService(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget { // to check user signed in before or not
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const homeScreen();
    }
    return loginScreen();
  }
}

