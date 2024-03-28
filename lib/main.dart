import 'package:chat/controller/auth_provider.dart';
import 'package:chat/controller/basic_provider.dart';
import 'package:chat/controller/firbase_provider.dart';
import 'package:chat/firebase_options.dart';
import 'package:chat/service/auth/auth_gate.dart';
import 'package:chat/view/spalsh.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirebaseProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => BasicProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthGate(),
      ),
    );
  }
}
