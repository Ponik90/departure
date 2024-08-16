import 'package:departure/screen/chapter/provider/chapter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  ChapterProvider? providerR;
  ChapterProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<ChapterProvider>().getLikeData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ChapterProvider>();
    providerW = context.watch<ChapterProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked Verse"),
      ),
      body: ListView.builder(
        itemCount: providerW!.likeList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Want to delete Verse"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            onPressed: () {
                              providerW!.deleteVerse(index);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "delete",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            title: Text(providerW!.likeList[index]),
          );
        },
      ),
    );
  }
}
