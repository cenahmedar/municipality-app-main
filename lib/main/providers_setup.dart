import 'dart:ui';

import 'package:municipality_app/change_notifiers/locale_change_notifier.dart';
import 'package:municipality_app/change_notifiers/requests_change_notifier.dart';
import 'package:municipality_app/change_notifiers/service_change_notifier.dart';
import 'package:municipality_app/change_notifiers/user_change_notifier.dart';
import 'package:municipality_app/models/request.dart';
import 'package:municipality_app/models/requests_list.dart';
import 'package:municipality_app/models/user.dart';
import 'package:municipality_app/models/service_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider.value(value: UserChangeNotifier()),
  ChangeNotifierProvider.value(value: ServicesChangeNotifier()),
  ChangeNotifierProvider.value(value: RequestsChangeNotifier()),
  ChangeNotifierProvider.value(value: LocaleChangeNotifier()),
];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<User?>(
    initialData: null,
    create: (context) => context.read<UserChangeNotifier>().user,
    lazy: false,
  ),
  StreamProvider<List<ServiceModel>?>(
    initialData: null,
    create: (context) => context.read<ServicesChangeNotifier>().services,
    lazy: false,
  ),
  StreamProvider<RequestsList?>(
    initialData: null,
    create: (context) => context.read<RequestsChangeNotifier>().orders,
    lazy: false,
  ),
  StreamProvider<Locale?>(
    initialData: Locale('ar'),
    create: (context) => context.read<LocaleChangeNotifier>().locale,
    lazy: false,
  ),
];
