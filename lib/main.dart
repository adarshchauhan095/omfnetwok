import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';
import 'package:omf_netflix/domain/domain.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await initServices();
    runApp(const MyApp());
  } catch (exception) {
    Utility.printELog(exception.toString());
  }
}

Future<void> initServices() async {
  Get.put(
    Repository(
      Get.put(
        DeviceRepository(),
        permanent: true,
      ),
      Get.put(
          DataRepository(
            Get.put(
              ConnectHelper(),
              permanent: true,
            ),
          ),
          permanent: true),
    ),
  );

  /// Services
  await Get.putAsync(() => CommonService().init());
  await Get.putAsync(() => DbService().init());
}

class DbService extends GetxService {
  Future<DbService> init() async {
    await Get.find<DeviceRepository>().init();
    return this;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorsValue.scaffoldBackgroundColor,
      statusBarBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      designSize: const Size(375, 745),
      builder: () => GetMaterialApp(
        locale: const Locale('en'),
        title: StringConstants.appName,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        translations: TranslationsFile(),
        supportedLocales: TranslationsFile.listOfLocales,
        getPages: AppPages.pages,
        initialRoute: AppPages.initial,
        enableLog: true,
      ),
    );
  }
}
