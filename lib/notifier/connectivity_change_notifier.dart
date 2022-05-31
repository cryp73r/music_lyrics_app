import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityChangeNotifier extends ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  ConnectivityChangeNotifier() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityResult=result;
      notifyListeners();
    });
  }
  ConnectivityResult get connectivity => _connectivityResult;

  void initialLoad() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    _connectivityResult=connectivityResult;
    notifyListeners();
  }
}