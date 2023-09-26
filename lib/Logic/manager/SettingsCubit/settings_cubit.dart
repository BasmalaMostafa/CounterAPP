import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(
      const SettingsState(
      appNotifications: false,
      emailNotifications: false));

  static SettingsCubit get(context) => BlocProvider.of(context);

  void notifyApp(bool value){
    emit(state.copyWith(appNotifications: value));
  }

  void notifyEmail(bool value){
    emit(state.copyWith(emailNotifications: value));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }

  @override
  void onChange(Change<SettingsState> change) {
    // TODO: implement onChange
    print(change);
    super.onChange(change);
  }
}
