import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/apis/ApiClient.dart';
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
  // initialize api client
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
      // responseBody: true,
      // request: true,
      // requestBody: true,
      ));
  ApiClient apiClient = ApiClient(dio);
  BlocOverrides.runZoned(
    () => runApp(MyApp(
      apiClient: apiClient,
    )),
    blocObserver: SimpleBlocDelegate(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiClient}) : super(key: key);
  final ApiClient apiClient;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepositoryImpl(apiClient: apiClient),
        ),
        RepositoryProvider(
          create: (context) => UserRepositoryImpl(apiClient: apiClient),
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
