import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/router/app_router.dart';
import 'package:flutter/material.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark( ),
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null

      ?AppPages.onboarding
      :AppPages.main,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
