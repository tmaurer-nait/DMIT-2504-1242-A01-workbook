import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  var photosDir = '';
  List<String> photoList = [];

  @override
  void initState() {
    super.initState();
    getApplicationCacheDirectory().then((dir) {
      setState(() {
        photosDir = dir.path;

        dir.listSync().toList().forEach((file) {
          if (file.path.endsWith('jpg')) photoList.add(file.path);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('View Photos Page')),
        body: Center(
          child: Column(
            children: [
              photoList.isEmpty
                  ? Text('No Saved Photos')
                  : Expanded(
                      child: ListView.builder(
                          itemCount: photoList.length,
                          itemBuilder: (context, idx) {
                            return ListTile(
                              leading: Image.file(
                                File(photoList[idx]),
                                height: 50,
                                width: 50,
                              ),
                              title: Text(photoList[idx]),
                            );
                          }),
                    )
            ],
          ),
        ));
  }
}
