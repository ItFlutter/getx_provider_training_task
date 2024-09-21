import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File> removeImageBackground(File imageFile) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('https://api.remove.bg/v1.0/removebg'),
  );
  request.files
      .add(await http.MultipartFile.fromPath('image_file', imageFile.path));
  request.headers.addAll({"X-Api-Key": "qsKa5PkntqVx4kuzt9pUFUBL"});

  var response = await request.send();
  if (response.statusCode == 200) {
    var responseData = await response.stream.toBytes();
    var tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/output.png');
    await file.writeAsBytes(responseData);
    return file;
  } else {
    throw Exception('Failed to remove background');
  }
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(path);

  final file = File('${(await getTemporaryDirectory()).path}/temp_image.png');
  await file.writeAsBytes(byteData.buffer.asUint8List());
  return file;
}

Future<File> downloadImageFromFakeApi(String imageUrl) async {
  var response = await http.get(Uri.parse(imageUrl));

  if (response.statusCode == 200) {
    var tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/downloaded_image.png');
    await file.writeAsBytes(response.bodyBytes);
    return file;
  } else {
    throw Exception('Failed to download image');
  }
}
