import 'package:flutter/material.dart';
import 'controller.dart';
import 'model.dart';
import 'package:get/get.dart';

class FileSystemTree extends StatelessWidget {
  // final TreeNode root;
  TreeViewController controller = Get.put(TreeViewController());

  FileSystemTree({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildNodeItems();
  }

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
}

// class FileSystemTree extends StatelessWidget {
//   final List<TreeNode> data;
//
//   const FileSystemTree(this.data, {super.key});
//
//   Widget _buildTree(List<TreeNode> items) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//
//         return item.childFolders!.isNotEmpty
//             ? ListTile(
//                 title: Text(item.folderName.toString()),
//                 subtitle: _buildTree(item.childFolders!.toList()),
//               )
//             : ListTile(
//                 title: Text(item.folderName.toString()),
//               );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildTree(data);
//   }
// }
