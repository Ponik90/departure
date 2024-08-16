import 'package:departure/screen/setting/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_preference/shared_helper.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingProvider? providerR;
  SettingProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<SettingProvider>();
    providerR = context.read<SettingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Settings"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text("Theme"),
            subtitle: const Text("Change Theme"),
            trailing: Switch(
                activeColor: Colors.orangeAccent,
                onChanged: (value) {
                  SharedHelper shr = SharedHelper();
                  shr.setThemeData(value);
                  providerR!.changeTheme();
                },
                value: providerW!.isTheme),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Change Language",
              style: TextStyle(fontSize: 16),
            ),
          ),
          RadioListTile(
            value: "english",
            groupValue: providerW!.language,
            onChanged: (value) {
              providerR!.changeLanguage(value!);
            },
            title: const Text("English"),
          ),
          RadioListTile(
            value: "sanskrit",
            groupValue: providerW!.language,
            onChanged: (value) {
              providerR!.changeLanguage(value!);
            },
            title: const Text("Sanskrit"),
          ),
          RadioListTile(
            value: "gujrati",
            groupValue: providerW!.language,
            onChanged: (value) {
              providerR!.changeLanguage(value!);
            },
            title: const Text("Gujrati"),
          ),
        ],
      ),
    );
  }
}
