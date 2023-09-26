part of 'settings_cubit.dart';

class SettingsState{
  final bool appNotifications;
  final bool emailNotifications;

  const SettingsState({
    required this.appNotifications, required this.emailNotifications,});

  SettingsState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
}){
    return SettingsState(
        appNotifications: appNotifications ?? this.appNotifications,
        emailNotifications: emailNotifications ?? this.emailNotifications
    );
  }

  //work well
  Map<String, dynamic> toMap() {
    return {
      'appNotifications': this.appNotifications,
      'emailNotifications': this.emailNotifications,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      appNotifications: map['appNotifications'] as bool,
      emailNotifications: map['emailNotifications'] as bool,
    );
  }

  @override
  String toString() {
    return 'SettingsState{appNotifications: $appNotifications, emailNotifications: $emailNotifications}';
  }

// @override
  // // TODO: implement props
  // List<Object?> get props => [appNotifications,emailNotifications];
}

