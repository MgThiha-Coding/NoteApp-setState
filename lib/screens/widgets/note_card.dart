import 'package:flutter/material.dart';
import 'package:ninja_note/models/note_model.dart';
import 'package:ninja_note/screens/widgets/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index, required this.onNoteDeleted});
  
  final Note note;
  final int index;

  final Function(int) onNoteDeleted; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap :(){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(note: note, index: index, onNoteDeleted: onNoteDeleted,)));
      },
      child: Card(
              elevation: 100,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(note.title,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 10),
                    Text(
                      note.body,
                      style: TextStyle(
                        fontSize: 20,
                        color : Colors.grey[900]
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}