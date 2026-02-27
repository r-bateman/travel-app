import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addJournalEntry(String title, String content) async {
  await FirebaseFirestore.instance.collection('journal_entries').add({
    'title': title,
    'content': content,
    'created_at': Timestamp.now(),
  });
}