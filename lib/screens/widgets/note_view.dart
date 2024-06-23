import 'package:flutter/material.dart';
import 'package:ninja_note/models/note_model.dart';

class NoteView  extends StatelessWidget {
  const NoteView ({super.key, required this.note, required this.index, required this.onNoteDeleted});
  final Note note;
  final int index;

  final Function(int) onNoteDeleted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
       appBar: AppBar(  
        elevation: 30,
         title : Text("Note View"),
         actions: [  
           IconButton(onPressed: (){
             showDialog(context: context, builder: (context){
                return  AlertDialog(
                   title : Text("Delete This?"),
                   content: Text("Note ${note.title} will be deleted"),
                   actions: [  
                    TextButton(onPressed: (){
                     Navigator.of(context).pop();
                     onNoteDeleted(index);
                     Navigator.of(context).pop();
                    }, child: Text("CANCEL")),
                     TextButton(onPressed: (){
                     Navigator.of(context).pop();
                    }, child: Text("DELETE")),
                   ],
                );
             });
           }, icon: Icon(Icons.delete,size:25))
         ],
       ),
       body : Padding(
        padding: const EdgeInsets.all(10.0),
        child : Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [  
            Text(
              note.title, 
              style : TextStyle(  
                 fontSize: 18,
              )
            ),
            SizedBox( height : 10),
             Text(
              note.body, 
              style : TextStyle(  
                 fontSize: 18,
              )
            ),
           ],
        ),
       ),
    );
  }
}