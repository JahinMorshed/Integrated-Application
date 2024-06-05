// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';

// class UploadPage extends StatefulWidget {
//   @override
//   _UploadPageState createState() => _UploadPageState();
// }

// class _UploadPageState extends State<UploadPage> {
//   File? _resumeFile;

//   Future<void> _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'doc', 'docx'],
//     );

//     if (result != null && result.files.single.path != null) {
//       setState(() {
//         _resumeFile = File(result.files.single.path!);
//       });
//     }
//   }

//   Widget _buildFileSticker() {
//     if (_resumeFile == null) return Container();
//     String fileExtension = _resumeFile!.path.split('.').last;

//     IconData fileIcon;
//     Color iconColor;

//     switch (fileExtension) {
//       case 'pdf':
//         fileIcon = Icons.picture_as_pdf;
//         iconColor = Colors.red;
//         break;
//       case 'doc':
//       case 'docx':
//         fileIcon = Icons.description;
//         iconColor = Colors.blue;
//         break;
//       default:
//         fileIcon = Icons.insert_drive_file;
//         iconColor = Colors.grey;
//         break;
//     }

//     return Column(
//       children: [
//         Icon(fileIcon, size: 100, color: iconColor),
//         SizedBox(height: 10),
//         Text(
//           _resumeFile!.path.split('/').last,
//           style: TextStyle(color: Colors.black),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Resume/CV'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//         titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
//         elevation: 0,
//       ),
//       body: Container(
//         color: Colors.white,
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_resumeFile != null) _buildFileSticker(),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickFile,
//               child: Text('Pick a file'),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.blue,
//               ),
//             ),
//             SizedBox(height: 20),
//             if (_resumeFile != null)
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement your upload functionality here
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                           'Uploading ${_resumeFile!.path.split('/').last}...'),
//                     ),
//                   );
//                 },
//                 child: Text('Upload'),
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.green,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _resumeFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _resumeFile = File(result.files.single.path!);
      });
    }
  }

  Widget _buildFileSticker() {
    if (_resumeFile == null) return Container();
    String fileExtension = _resumeFile!.path.split('.').last;

    IconData fileIcon;
    Color iconColor;

    switch (fileExtension) {
      case 'pdf':
        fileIcon = Icons.picture_as_pdf;
        iconColor = Colors.red;
        break;
      case 'doc':
      case 'docx':
        fileIcon = Icons.description;
        iconColor = Colors.blue;
        break;
      default:
        fileIcon = Icons.insert_drive_file;
        iconColor = Colors.grey;
        break;
    }

    return Column(
      children: [
        Icon(fileIcon, size: 100, color: iconColor),
        const SizedBox(height: 10),
        Text(
          _resumeFile!.path.split('/').last,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildFilePreview() {
    if (_resumeFile == null) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'File Path: ${_resumeFile!.path}',
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 10),
        _buildFileSticker(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Resume/CV'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_resumeFile != null) _buildFilePreview(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickFile,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text('Pick a file'),
            ),
            const SizedBox(height: 20),
            if (_resumeFile != null)
              ElevatedButton(
                onPressed: () {
                  // Implement your upload functionality here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Uploading ${_resumeFile!.path.split('/').last}...'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: const Text('Upload'),
              ),
          ],
        ),
      ),
    );
  }
}
