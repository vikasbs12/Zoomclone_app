import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoomclone_app/resources/auth_methods.dart';
import 'package:zoomclone_app/screens/home_screen.dart';
import 'package:zoomclone_app/screens/login_screen.dart';
import 'package:zoomclone_app/utils/colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB7oy9B5GQivWOB5g02jrItEEhP_ET2Q1k',
      authDomain: 'vikas-1cca9.firebaseapp.com',
      projectId: 'vikas-1cca9',
      databaseURL: 'https://vikas-1cca9-default-rtdb.asia-southeast1.firebasedatabase.app',
      storageBucket: 'vikas-1cca9.appspot.com',
      messagingSenderId: '931422818625', // Replace with your messagingSenderId
      appId: '1:931422818625:android:bf1b46b96e01be416951c0',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Zoom Clone",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        './login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().AuthChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          if (snapshot.hasData) {
            return const HomeScreen();
          } 
          if (snapshot.hasError) {
            // Handle error here, e.g., show an error message
            return const Center(child: Text('Error occurred.'));
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
