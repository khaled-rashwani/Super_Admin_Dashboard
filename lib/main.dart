import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:super_admin_dashboard/login/login_screen.dart';
import 'package:super_admin_dashboard/project_shared/bloc_observer.dart';
import 'package:super_admin_dashboard/project_shared/network/shared_preferences.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/layout/cubit/cubit.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/layout/cubit/menu_app_controller.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/layout/cubit/states.dart';
import 'package:super_admin_dashboard/project_shared/constants.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/layout/dashboard_layout/dashboard_layout.dart';
import '../../project_shared/network/dio.dart';
import 'admin_dashboard/admin_create_product/create_product_screen.dart';
import 'admin_dashboard/layout/admin_layout.dart';
import 'admin_dashboard/layout/cubit/admin_cubit.dart';
import 'admin_dashboard/layout/cubit/admin_menu_app_controller.dart';
import 'login/login_cubit/login_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  dioHelper.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel Dashboard',

      theme: ThemeData.dark().copyWith(
        primaryColorDark: primaryColorMaterial,
        appBarTheme: AppBarTheme(backgroundColor: myLightBG),
        scaffoldBackgroundColor: myDarkBG,
        primaryColor: primaryColor,
        canvasColor: myLightBG,
      ),


      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>MenuAppController()),
          BlocProvider(create: (context)=>DashboardCubit()),
          ChangeNotifierProvider(create: (context)=>AdminMenuAppController()),
          BlocProvider(create: (context)=>AdminDashboardCubit()),
          BlocProvider(create: (context)=>AuthCubit()),
        ],
        child: BlocConsumer<DashboardCubit, DashboardStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Admin Panel Dashboard',
            theme: ThemeData.dark().copyWith(
              primaryColorDark: primaryColorMaterial,
              appBarTheme: AppBarTheme(backgroundColor: myLightBG),
              scaffoldBackgroundColor: myDarkBG,
              primaryColor: primaryColor,
              canvasColor: myLightBG,
            ),
            home: LoginScreen(),
          ),
        )
      )
    );
  }
}
