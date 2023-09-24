import 'package:counterapp/Logic/manager/SettingsCubit/settings_cubit.dart';
import 'package:counterapp/shared/Components/components.dart';
import 'package:counterapp/shared/Components/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  final String title;
  final Color color;

  const SettingsScreen({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          // TODO: implement listener
          final notifications =SnackBar(
              duration: const Duration(microseconds: 700),
              content: Text('App ${state.appNotifications.toString().toUpperCase()},'
                  ' Email ${state.emailNotifications.toString().toUpperCase()}')
          );
          ScaffoldMessenger.of(context).showSnackBar(notifications);
        },
        builder: (context, state) {
          var settings = SettingsCubit.get(context);

          return Column(
            children: [
              SwitchListTile(
                activeColor: color,
                value: state.appNotifications,
                onChanged: (value) {
                  settings.notifyApp(value);
                },
                title: const Text('App Notifications'),
              ),
              Container(
                width: double.infinity,
                color: const MyColors().grey,
                height: 1,
              ),
              SwitchListTile(
                activeColor: color,
                value: state.emailNotifications,
                onChanged: (value) {
                  context.read<SettingsCubit>().notifyEmail(value);  //assssssk
                },
                title: const Text('Email Notifications'),
              ),
              Container(
                width: double.infinity,
                color: const MyColors().grey,
                height: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
