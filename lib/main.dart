import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'features/app/splash_screen/splash_screen.dart';
import 'features/user_auth/presentation/pages/login_page.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyCevGcsVnG9mEl4BwEk97fLlF39YDZGulk",
        authDomain: "test123-9965c.firebaseapp.com",
        projectId: "test123-9965c",
        storageBucket: "test123-9965c.appspot.com",
        messagingSenderId: "703273543788",
        appId: "1:703273543788:web:cf29bd309c2fea374d9049"
    ));

  }
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase',
        home: SplashScreen(
          child: LoginPage(),
        )
    );
  }
}

