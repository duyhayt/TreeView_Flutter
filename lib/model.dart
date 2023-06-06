class TreeNode {
  String? id;
  String? folderName;
  String? parentId;
  String? tenantId;
  String? crateTime;
  bool? isParent;
  String? modifiedTime;
  List<TreeNode>? childFolders;

  TreeNode({this.id, this.isParent, this.folderName, this.parentId, this.tenantId, this.crateTime, this.modifiedTime, this.childFolders = const []});

  factory TreeNode.fromJson(Map<String, dynamic> json) => TreeNode(
        id: json["id"],
        folderName: json["folderName"],
        parentId: json["parentId"],
        tenantId: json["tenantId"],
        crateTime: json["crateTime"],
        isParent: json["isParent"],
        modifiedTime: json["modifiedTime"],
        childFolders: List<TreeNode>.from(json["childFolders"].map((x) => TreeNode.fromJson(x))),
      );
}
