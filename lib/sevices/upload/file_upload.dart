import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class FileUpload extends StatefulWidget {
  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('File Upload'),
    ),
    body: Center(
      child: Text('File Upload')
    ),
    floatingActionButton: FloatingActionButton.extended(
  heroTag: 'picker',
  elevation: 0,
  backgroundColor: Colors.tealAccent[400],
  hoverElevation: 0,
  label: Row(
    children: <Widget>[
      Icon(Icons.file_upload),
      SizedBox(width: 10),
      Text('Choose File')
    ],
  ),
  onPressed: () {
    dropDown();
  },
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
  }
}


dropDown() {
return DropdownButton(
  hint: Text("Select"),
  items: DropdownMenuItem(
    child: Text('Audio')
    value: FileType.AUDIO,
    ), 
  items: DropdownMenuItem(
    child: Text('Video')
    value: FileType.VIDEO,
    ), 
  items: DropdownMenuItem(
    child: Text('Image')
    value: FileType.IMAGE,
    ), 
  items: DropdownMenuItem(
    child: Text('Any')
    value: FileType.ANY,
    ), 
  onChanged: null);
}

