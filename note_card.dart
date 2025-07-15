import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;

  NoteCard({required this.note, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
      ),
    );
  }
}

