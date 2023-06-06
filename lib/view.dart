import 'package:flutter/material.dart';
import 'controller.dart';
import 'model.dart';
import 'package:get/get.dart';

class FileSystemTree extends StatelessWidget {
  // final TreeNode root;
  TreeViewController controller = Get.put(TreeViewController());

  FileSystemTree({super.key});

  Widget _buildNodeItems() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.listNodes.length,
        itemBuilder: (BuildContext context, int index) {
        final node = controller.listNodes[index];
          return _buildTree(node);
        },
    );
  }

  Widget _buildTree(TreeNode item) {
    return item.childFolders!.isNotEmpty
        ? ExpansionTile(
      title: Text(item.folderName.toString()),
      children: item.childFolders!.map((child) => _buildTree(child)).toList(),
    )
        : ListTile(
      title: Text(item.folderName.toString()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _buildNodeItems();
  }
}

