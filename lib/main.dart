import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_1/core/class/crud.dart';
import 'package:task_1/core/class/sqldb.dart';
import 'package:task_1/core/services/services.dart';
import 'package:task_1/model/data/datasource/remote/home_data.dart';
import 'package:task_1/routes.dart';
import 'package:task_1/view/home/controller/homescreen_controller.dart';
import 'core/constant/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FutureProvider<MyServices>(
    initialData: MyServices(),
    create: (context) async {
      return await MyServices().init();
    },
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiProvider(
            providers: [
              Provider<SqlDb>(
                create: (context) => SqlDb(),
              ),
              Provider<Crud>(
                create: (context) => Crud(),
              ),
              ChangeNotifierProvider<HomeScreenController>(
                create: (context) => HomeScreenController(
                    myServices: context.read<MyServices>(),
                    sqlDb: context.read<SqlDb>(),
                    homeData: HomeData(context.read<Crud>())),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              // getPages: routes,
              routes: routes,
              // initialBinding: InitialBindings(),
              // themeMode: ThemeMode.dark,
              theme: appTheme,
            ),
          );
        });
  }
}
