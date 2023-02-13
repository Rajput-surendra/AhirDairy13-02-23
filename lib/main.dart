import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:milk/themes/themes.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'themes/themeprovider.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return GetMaterialApp(
            translations: Messages(),
            locale: Locale('en', 'US'),
            fallbackLocale: Locale('en', 'US'),
            title: 'AHIR DAIRY',
            navigatorObservers: [BotToastNavigatorObserver()],
            builder: BotToastInit(),
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            initialRoute: "/",
            getPages: AppRoutes.routes,
          );
        });
  }
}
