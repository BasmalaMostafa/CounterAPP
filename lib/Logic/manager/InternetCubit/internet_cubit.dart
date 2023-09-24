import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counterapp/shared/Components/enums.dart';
import 'package:flutter/cupertino.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
    checkInternetConnection();
  }

  //Arch. tip2
  checkInternetConnection(){
     connectivity.onConnectivityChanged.listen(
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

}
