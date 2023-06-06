import 'package:flutter/material.dart';
import 'package:tree_view/tree_view.dart';
import 'package:get/get.dart';
import 'package:treeview/view.dart';

import 'controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TreeViewController controller = Get.put(TreeViewController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FileSystemTree Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('FileSystemTree Demo'),
          ),
          body: FileSystemTree(),
      ));
  }
}
