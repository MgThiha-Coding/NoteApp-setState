import 'package:flutter/material.dart';
import 'package:ninja_note/screens/create_note.dart';
import 'package:ninja_note/screens/widgets/note_card.dart';

import '../models/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("",
            style: const TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        elevation: 30,
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        //   backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
            note: notes[index],
            index: index,
            onNoteDeleted: onNoteDeleted,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateNote(
              onNewNoteCreated: onNoteCreated, // Corrected function name
            ),
          ));
        },
        backgroundColor: Color.fromARGB(255, 241, 239, 239),
        child: const Text("Add",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17)),
      ),
    );
  }

  void onNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
