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
    ['Four score and seven years ago, our founding fathers made a pretty cool country (except for the slavery).', 'lib/assets/images/test_image_1.jpeg','2026-01-12'],
    ['Site 2', 'lib/assets/images/test_image_2.jpeg','2026-01-12'],
    ['Site 3', 'lib/assets/images/test_image_3.jpeg','2026-01-13'],
    ['Site 4', 'lib/assets/images/test_image_4.jpeg','2026-01-14'],
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

