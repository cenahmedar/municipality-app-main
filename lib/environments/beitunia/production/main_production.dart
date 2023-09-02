import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:municipality_app/main/main.dart';
import 'package:municipality_app/environments/beitunia/production/production.dart';
import 'package:municipality_app/environments/config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(config: Config.fromJson(config));
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MunicipalityAppWrapper());
}
