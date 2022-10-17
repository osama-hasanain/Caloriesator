import 'package:calories_calculator/cubit/cubit.dart';
import 'package:calories_calculator/data/cache_helper.dart';
import 'package:calories_calculator/presentaion/spalsh.dart';
import 'package:calories_calculator/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CaloriesatorLayoutCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Caloriesator',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: ColorManager.background,
          appBarTheme: AppBarTheme(
            backgroundColor: ColorManager.primaryDark,
            iconTheme: IconThemeData(
              color: Color(0xFFC7A317)
            )
          ),
          radioTheme: RadioThemeData(
             fillColor: MaterialStateProperty.all<Color>(ColorManager.primary)
          ),
          
        ),
        home: const SplashScreen(),
        // getPages: [
        //   GetPage(name: '/', page: ()=> const SplashScreen()),
        //   GetPage(name: '/metricesChoice', page: ()=> MetricsChoices()),
        // ],
      ) 
    );
  }
}
