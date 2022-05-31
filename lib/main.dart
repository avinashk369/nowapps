import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/utils/utils.dart';

import 'blocs/bloc_delegate.dart';
import 'repository/product/product_repositoryImpl.dart';
import 'repository/user/user_repositoryimpl.dart';
import 'routes/route_constants.dart';
import 'routes/route_generator.dart';
import 'styles/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.getInstance();
  Paint.enableDithering = true;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocDelegate(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepositoryImpl(),
        ),
        RepositoryProvider(
          create: (context) => UserRepositoryImpl(),
        ),
      ],
      child: MaterialApp(
        title: appName,
        initialRoute: homeRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
      ),
    );
  }
}
