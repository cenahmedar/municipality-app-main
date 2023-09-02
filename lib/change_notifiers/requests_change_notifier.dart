import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:municipality_app/models/request.dart';
import 'package:municipality_app/models/requests_list.dart';

import 'package:municipality_app/services/requests_service.dart';

class RequestsChangeNotifier extends ChangeNotifier {
  StreamController<RequestsList?> _ordersController =
      StreamController<RequestsList?>.broadcast();
  Stream<RequestsList?> get orders => _ordersController.stream;
  late RequestsService _requestsService;
  RequestsChangeNotifier() {
    _requestsService = RequestsService();
  }

  void setOrders(List<Request>? orders) {
    _ordersController.add(RequestsList(list: orders ?? []));
  }

  Future<List<Request>?> loadRequests() async {
    List<Request>? orders = await _requestsService.getOrders();
    setOrders(orders);
    return orders;
  }
}
