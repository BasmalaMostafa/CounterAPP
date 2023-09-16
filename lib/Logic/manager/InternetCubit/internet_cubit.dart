import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counterapp/shared/Components/enums.dart';
import 'package:flutter/cupertino.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late final StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen(
            (connectivityResult) {
              if (connectivityResult == ConnectivityResult.wifi){
                internetConnected(ConnectionType.wifi);
              }else if(connectivityResult ==ConnectivityResult.mobile){
                internetConnected(ConnectionType.mobileData);
              }else if(connectivityResult ==ConnectivityResult.none){
                internetDisconnected();
              }
            });
  }

  void internetConnected(ConnectionType connectionType)
  => emit(InternetConnected(connectionType: connectionType));


  void internetDisconnected() => emit(InternetDisconnected());


  @override
  Future<void> close() {
    // TODO: implement close
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}
