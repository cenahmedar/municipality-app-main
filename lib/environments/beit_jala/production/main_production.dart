import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:municipality_app/main/main.dart';
import 'package:municipality_app/environments/beit_jala/production/production.dart';
import 'package:municipality_app/environments/config/config.dart';

// import 'package:municipality_app/previous/presentation/main/pages/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FlavorConfig(config: Config.fromJson(config));
  runApp(
    MunicipalityAppWrapper(),
  );
}
