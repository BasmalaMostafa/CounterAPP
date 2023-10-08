import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counterapp/Repositories/internet_repo.dart';
import 'package:counterapp/shared/Components/enums.dart';

class InternetPlugin extends InternetRepo {
  late final Connectivity connectivity;
  late ConnectionType connectionType;

  //Arch. tip2
  @override
  ConnectionType checkInternetConnection(){
    connectivity.onConnectivityChanged.listen(
            (connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi){
            connectionType=ConnectionType.wifi;
          }else if(connectivityResult ==ConnectivityResult.mobile){
            connectionType= ConnectionType.mobileData;
          }else if(connectivityResult ==ConnectivityResult.none){
            connectionType= ConnectionType.none;
          }
        });
    return connectionType;
  }
}







