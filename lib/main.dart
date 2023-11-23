import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mynisit/features/user_auth/db/db_helper.dart';
import 'package:mynisit/features/user_auth/presentation/services/theme_services.dart';
import 'package:mynisit/features/user_auth/presentation/view_models/app_view_model.dart';
import 'package:provider/provider.dart';
import 'features/app/screen/screen.dart';
import 'features/user_auth/presentation/pages/login_page.dart';
import 'features/user_auth/presentation/pages/sign_up_page.dart';
import 'features/user_auth/presentation/screens/home_screen.dart';
import 'features/user_auth/presentation/widgets/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyASbTWp6AIWuFYuV8p06xMkgXTMVYmNgE8",
      appId: "1:630862321415:android:32cfc645f975a738f057a2",
      messagingSenderId: "630862321415",
      projectId: "mynisit-8e8a7",
      // Your web Firebase config options
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Nisit',
      debugShowCheckedModeBanner: false,
      theme: ThemesColor.light,
      darkTheme: ThemesColor.dark,
      themeMode: ThemeService().theme,
      initialRoute: '/',
      routes: {
        '/': (context) => Screen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
