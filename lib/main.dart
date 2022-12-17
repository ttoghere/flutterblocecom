import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterblocecom/config/app_router.dart';
import 'package:flutterblocecom/config/theme_data.dart';
import 'package:flutterblocecom/firebase_options.dart';
import 'package:flutterblocecom/screens/screens_shelf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: HomePage.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
