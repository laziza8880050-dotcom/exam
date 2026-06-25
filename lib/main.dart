
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/app.dart';
import 'package:fitness/firebase_options.dart';
import 'package:fitness/src/feature/auth/cubit/auth_cubit.dart';
import 'package:fitness/src/feature/home/cubit/home_cubit.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:fitness/src/feature/settings/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => SetUpCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ProfileCubit()..getUser()),

      ],
      child: ExamApp(),
    ),
  );
}

