import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:municipality_app/models/service_model.dart';
import 'package:municipality_app/services/services_service.dart';

class ServicesChangeNotifier extends ChangeNotifier {
  StreamController<List<ServiceModel>?> _servicesController =
      StreamController<List<ServiceModel>?>.broadcast();
  Stream<List<ServiceModel>?> get services => _servicesController.stream;
  late ServicesService _servicesService;
  ServicesChangeNotifier() {
    _servicesService = ServicesService();
  }

  void setServices(List<ServiceModel>? services) {
    _servicesController.add(services);
  }

  Future<List<ServiceModel>?> loadServices() async {
    List<ServiceModel>? services = await _servicesService.getServices();
    setServices(services);
    return services;
  }
}
