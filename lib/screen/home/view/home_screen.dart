import 'dart:ui';

import 'package:departure/screen/home/provider/home_provider.dart';
import 'package:departure/screen/setting/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;

  HomeProvider? providerW;

  SettingProvider? providerSR;
  SettingProvider? providerSW;

  @override
  void initState() {
    super.initState();

    context.read<HomeProvider>().getGitaJson();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    providerSR = context.read<SettingProvider>();
    providerSW = context.watch<SettingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bhagavad Gita",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'setting');
              },
              icon: const Icon(Icons.settings_outlined),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Chapters",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.gitaList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'chapter',
                        arguments: providerW!.gitaList[index]);
                  },
                  leading: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade100,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "${providerW!.gitaList[index].chapter_id}",
                      style: TextStyle(color: Colors.deepOrangeAccent.shade700),
                    ),
                  ),
                  title: Text(
                    "${providerSW!.language == "english" ? providerW!.gitaList[index].chapter_2 : providerSW!.language == "gujrati" ? providerW!.gitaList[index].chapter_3 : providerW!.gitaList[index].chapter}",
                  ),
                  subtitle:
                      Text("${providerW!.gitaList[index].verses_no} verses"),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
