
import 'dart:io';

import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String? imagePath;

  FullScreenImageViewer({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: imagePath != null
              ? PhotoView(
                  imageProvider: FileImage(File(imagePath!)),
                  backgroundDecoration: BoxDecoration(color: Colors.black),
                )
              : Icon(
                  Icons.error,color: Colors.white,size: 100,
                ),
        ),
      ),
    );
  }
}