import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynote/data/db_helper.dart';

import 'package:mynote/navigation/router.dart';
import 'package:mynote/provider/db_provaider.dart';
import 'package:mynote/views/Screens/Splach_Screen.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'),Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DbProvaider>(create: (context){
          return DbProvaider();

        })
      ],
      child: App1(),
    );
  }
}

class App1 extends StatelessWidget {
  const App1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: AppRouter.navKey,
          debugShowCheckedModeBanner: false,
          home:SplachScreen(),
        );
      },

    );
  }
}


