import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/memories_by_day_list.dart';

class MemoriesPage extends StatefulWidget {
  const MemoriesPage({super.key});

  @override
  State<MemoriesPage> createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
  List memories = [
    ['Site 1', 'lib/assets/images/test_image_1.jpeg','2026-01-12','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'],
    ['Site 2', 'lib/assets/images/test_image_2.jpeg','2026-01-12','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'],
    ['Site 3', 'lib/assets/images/test_image_3.jpeg','2026-01-13','Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.'],
    ['Site 4', 'lib/assets/images/test_image_4.jpeg','2026-01-14','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'],
  ];

  final Map<int, List<List<dynamic>>> unsortedMemoryList = {};
  List<int> sortedDateKeys = [];

  @override
  void initState() {
    super.initState();
    createMemoryListForPageView();
  }

  void createMemoryListForPageView() {
    unsortedMemoryList.clear();

    for (var i = 0; i < memories.length; i++) {
      final yearMonthDay = int.parse(memories[i][2].replaceAll('-', ''));
      (unsortedMemoryList[yearMonthDay] ??= []).add(memories[i]);
    }

    sortedDateKeys = unsortedMemoryList.keys.toList()..sort();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: sortedDateKeys.length,
        itemBuilder: (context, index) {
          final dateKey = sortedDateKeys[index];
          final currentDate = unsortedMemoryList[dateKey]!;
          return MemoryByDayList(
            currentDateMemories: currentDate,
            dateUnformatted: dateKey,
          );
        },
      ),
    );
  }
}

