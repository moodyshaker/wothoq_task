import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wothoq_task/providers/providers.dart';
import 'package:wothoq_task/screen/product_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localization/demo_localization.dart';

void main() async {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext ctx, Widget? child) => Builder(
              builder: (BuildContext c) => Consumer(builder: (
                BuildContext context,
                WidgetRef ref,
                Widget? child,
              ) {
                final local = ref.watch(languageProvider);
                return MaterialApp(
                  title: 'Wothoq Task',
                  debugShowCheckedModeBanner: false,
                  supportedLocales: [
                    Locale('en', 'US'),
                    Locale('ar', 'EG'),
                  ],
                  localizationsDelegates: [
                    DemoLocalization.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  locale: local,
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (locale.languageCode == deviceLocale!.languageCode &&
                          locale.countryCode == deviceLocale.countryCode) {
                        return deviceLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  theme: ThemeData(fontFamily: 'IBM'),
                  builder: (context, child) => Directionality(
                    child: child!,
                    textDirection: local.languageCode == 'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                  ),
                  home: ProductDetails(),
                );
              }),
            ));
  }
}
