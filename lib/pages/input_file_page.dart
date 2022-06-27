import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;

import '../constans.dart';

class InputFilePage extends StatelessWidget {
  InputFilePage({Key? key}) : super(key: key);

  List<PlatformFile>? _files;

  void _openFile() async{
    _files = (await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
      allowedExtensions: null
    ))!.files;
  }

  void _uploadFile() async{
    var uri = Uri.parse('https://a6e0-182-1-223-183.ap.ngrok.io/fileAPI/upload.php');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', _files!.first.path.toString()));
    var reponse = await request.send();
    if(reponse.statusCode == 200){
      print('uploaded');
    } else{
      print('something error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Database",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: yellowMain,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Pilih File Excel",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                _openFile();
              },
              child: Text("Pilih File"),
            ),
            ElevatedButton(
              onPressed: (){
                _uploadFile();
              },
              child: Text("Uploaded File"),
            ),
          ],
        ),
      ),
    );
  }
  void openFile(PlatformFile file){
    OpenFile.open(file.path!);
  }
}