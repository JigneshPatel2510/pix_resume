import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Preview extends StatelessWidget {
  final String? filePath;

  const Preview({super.key, this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () async {
                PermissionStatus result = await Permission.storage.request();
                if (result.isGranted) {
                  String sourceFilePath = filePath.toString();
                  Directory generalDownloadDir = Directory(
                      '/storage/emulated/0/Download'); //! THIS WORKS for android only !!!!!!

                  String qrName = "jigigig";

                  //qr image file saved to general downloads folder
                  File qrJpg =
                      await File('${generalDownloadDir.path}/$qrName.pdf')
                          .create();
                  try {
                    // Copy the file
                    File(sourceFilePath).copySync(qrJpg.path);

                    // File copied successfully
                    debugPrint('File copied to device storage download folder');
                  } catch (e) {
                    // Error copying the file
                    debugPrint('Error: $e');
                  }
                } else {
                  debugPrint('Permissions denied');
                }
              },
              icon: const Icon(
                Icons.save,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              ))
        ],
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
