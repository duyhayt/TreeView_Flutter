import 'package:get/get.dart';
import 'api.dart';
import 'model.dart';

class TreeViewController extends GetxController {
  static TreeViewController get instance => Get.find();
  final listNodes = <TreeNode>[].obs;

  getView() async {
    await ApiFolder().fetchTreeData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getView();
  }
}
