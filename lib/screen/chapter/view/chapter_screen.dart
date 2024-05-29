import 'package:departure/screen/home/model/home_model.dart';
import 'package:departure/screen/setting/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({super.key});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
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
    HomeModel m1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();

    providerSR = context.read<SettingProvider>();
    providerSW = context.watch<SettingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${providerSW!.language == "english" ? m1.chapter_2 : providerSW!.language == "gujrati" ? m1.chapter_3 : m1.chapter}"),
      ),
      body: Column(
        children: [
          Image.network(m1.url!),
          Expanded(
            child: ListView.builder(
              itemCount: providerSW!.language == "english"
                  ? m1.english!.length
                  : providerSW!.language == "gujrati"
                      ? m1.gujrati!.length
                      : m1.verses!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "${providerSW!.language == "english" ? m1.english![index] : providerSW!.language == "gujrati" ? m1.gujrati![index] : m1.verses![index]}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
