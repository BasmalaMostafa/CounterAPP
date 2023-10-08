import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counterapp/Repositories/internet_repo.dart';
import 'package:counterapp/shared/Components/enums.dart';
import 'package:flutter/cupertino.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final InternetRepo internetRepo;
  late ConnectionType connectionType;
  final Connectivity connectivity;

  InternetCubit(this.internetRepo, {required this.connectivity}) : super(InternetLoading()){
    checkConnection();
  }

  checkConnection() {
    connectionType = internetRepo.checkInternetConnection();

    if(connectionType == ConnectivityResult.none){
      internetDisconnected();
    }else{
      internetConnected(connectionType);
    }
  }


  void internetConnected(ConnectionType connectionType)
  => emit(InternetConnected(connectionType: connectionType));


  void internetDisconnected() => emit(InternetDisconnected());

}
