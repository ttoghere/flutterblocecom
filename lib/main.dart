import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocecom/blocs/wishlist_bloc/wishlist_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WishlistBloc()..add(StartWishlist())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        initialRoute: HomePage.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
