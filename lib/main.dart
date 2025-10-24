import 'package:voyzo_employee/Authentication/Provider/auth_provider.dart';
import 'package:voyzo_employee/Earning/Provider/earning_history_provider.dart';
import 'package:voyzo_employee/Home/Provider/home_provider.dart';
import 'package:voyzo_employee/Home/home_screen.dart';
import 'package:voyzo_employee/Localization/language_localization.dart';
import 'package:voyzo_employee/Localization/localization_constant.dart';
import 'package:voyzo_employee/Profile/Provider/notification_provider.dart';
import 'package:voyzo_employee/Profile/Provider/profile_provider.dart';
import 'package:voyzo_employee/Profile/Provider/review_provider.dart';
import 'package:voyzo_employee/Service%20Request/Provider/service_request_provider.dart';
import 'package:voyzo_employee/Utils/preferences_names.dart';
import 'package:voyzo_employee/Utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'Authentication/login_screen.dart';
import 'Theme/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((local) => {
          setState(() {
            _locale = local;
          })
        });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(),
          ),
          ChangeNotifierProvider<NotificationProvider>(
            create: (context) => NotificationProvider(),
          ),
          ChangeNotifierProvider<ReviewProvider>(
            create: (context) => ReviewProvider(),
          ),
          ChangeNotifierProvider<ServiceRequestProvider>(
            create: (context) => ServiceRequestProvider(),
          ),
          ChangeNotifierProvider<ProfileProvider>(
            create: (context) => ProfileProvider(),
          ),
          ChangeNotifierProvider<EarningHistoryProvider>(
            create: (context) => EarningHistoryProvider(),
          ),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: MaterialApp(
            title: 'Car-Q Employee',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme.lightTheme,
            locale: _locale,
            supportedLocales: const [
              Locale(english, 'US'),
              Locale(arabic, 'AE'),
            ],
            localizationsDelegates: const [
              LanguageLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocal, supportedLocales) {
              for (var local in supportedLocales) {
                if (local.languageCode == deviceLocal!.languageCode && local.countryCode == deviceLocal.countryCode) {
                  return deviceLocal;
                }
              }
              return supportedLocales.first;
            },
            home: SharedPreferenceHelper.getBoolean(PreferencesNames.isLogin) == false ? const LoginScreen() : const HomeScreen(),
          ),
        ),
      );
    }
  }
}
