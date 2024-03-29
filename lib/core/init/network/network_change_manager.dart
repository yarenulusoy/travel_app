// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
//
//
// enum NetworkResultEnums { on, off }
//
// typedef NetworkCallBack = void Function(NetworkResultEnums result);
//
// abstract class INetworkChangeManager {
//   Future<NetworkResultEnums> checkNetworkFirstTime();
//   void handleNetworkChange(NetworkCallBack onChange);
//   void dispose();
// }
//
// class NetworkChangeManager extends INetworkChangeManager {
//   late final Connectivity _connectivity;
//   StreamSubscription<ConnectivityResult>? _subscription;
//
//   NetworkChangeManager() {
//     _connectivity = Connectivity();
//   }
//
//   @override
//   Future<NetworkResultEnums> checkNetworkFirstTime() async {
//     final connectivityResult = await (_connectivity.checkConnectivity());
//     return checkConnectivityResult(connectivityResult);
//   }
//
//   @override
//   void handleNetworkChange(NetworkCallBack onChange) {
//     _subscription = _connectivity.onConnectivityChanged.listen((event) {
//       onChange.call(checkConnectivityResult(event));
//     });
//   }
//
//   @override
//   void dispose() {
//     _subscription?.cancel();
//   }
// }
//
// NetworkResultEnums checkConnectivityResult(ConnectivityResult result) {
//   switch (result) {
//     case ConnectivityResult.bluetooth:
//     case ConnectivityResult.wifi:
//     case ConnectivityResult.ethernet:
//     case ConnectivityResult.mobile:
//       return NetworkResultEnums.on;
//     case ConnectivityResult.none:
//       return NetworkResultEnums.off;
//     case ConnectivityResult.vpn:
//       break;
//   }
//   return NetworkResultEnums.off;
// }