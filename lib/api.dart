import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'controller.dart';
import 'model.dart';
import 'package:get/get.dart';



class ApiFolder {
  Future< List<TreeNode>> fetchTreeData() async {
    String url = 'http://183.91.3.60:8080/sca-0.2';
    String token =
        'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJZMXhoT25mc2tfelF5SnhKODFFWjZXdjBLUUF0LWNCdW5QdU9vTTlqZkxRIn0.eyJleHAiOjE2ODYwNzE4MDMsImlhdCI6MTY4NjAzNTgwMywianRpIjoiOTIyZTc0ODgtZTQ2Yy00MGI2LTgyZTktMjQzMmU3MzJjZWI5IiwiaXNzIjoiaHR0cHM6Ly9zZWMuY21jYXRpLnZuL2lhbS9yZWFsbXMvQ0lTVF8xIiwiYXVkIjpbInNzYV9iYWNrZW5kIiwiYWNjb3VudCJdLCJzdWIiOiJiNGFlOTg3Mi05MTA2LTQ5MzUtODNlNS0zYmY0ZWI4NzE5NzgiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzY2EtYmFjay1lbmQiLCJzZXNzaW9uX3N0YXRlIjoiYThjNjY0MWQtMzEzOS00MDA0LWJiNWMtODk0MzkwMzRmZTljIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyJodHRwOi8vbG9jYWxob3N0OjgwODAiLCJodHRwczovL3NlYy5jbWNhdGkudm4iXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwiZGVmYXVsdC1yb2xlcy1jaXN0XzEiLCJ1bWFfYXV0aG9yaXphdGlvbiIsIlVTRVIiXX0sInJlc291cmNlX2FjY2VzcyI6eyJzY2EtYmFjay1lbmQiOnsicm9sZXMiOlsiRWRpdE90aGVyRG9jdW1lbnQiLCJBZGRQZXJzb25hbERvY3VtZW50IiwiU2lnbk1hbnkiLCJVU0VSX1NDQSJdfSwic3NhX2JhY2tlbmQiOnsicm9sZXMiOlsiVVNFUl9TU0EiXX0sImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsInNpZCI6ImE4YzY2NDFkLTMxMzktNDAwNC1iYjVjLTg5NDM5MDM0ZmU5YyIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6Ik5ndXnhu4VuIEjDoCIsInByZWZlcnJlZF91c2VybmFtZSI6ImR1eWhhLnl0QGdtYWlsLmNvbSIsImdpdmVuX25hbWUiOiJOZ3V54buFbiIsImZhbWlseV9uYW1lIjoiSMOgIiwiZW1haWwiOiJkdXloYS55dEBnbWFpbC5jb20ifQ.fWIHEbcOSOqKfcz_Ur-gKki-Aq-AbME9baqSdqPn5tn2G-NbFPPpAS28buQikIsK3NXa7N5jiLhbW1pHMEeprrcK3-dsVB39TsT0E3_VNz6WtQEn4HOFL2MjqHWlTALmhSOpZnHO6C6HxYFlWbdIy7gn7Lv_bp2jxB8qMBMDOnPPcbZu63beUJRjoneLazPUWf98ROz7lkas3Azews6GLj2d-Flwk_rtCVPAhi7OdhKyCk-zbjgxuUq2bvL9-E6s9OgzGR30WCYo9vqDNJWLkxtGEVzP248B4HCv4MTZl-6wwTXOkXqO5cVZPsb45wJabE_1j0noSD34Qc749gHQLA';
    final dio = Dio(
      BaseOptions(
        baseUrl: url,
      ),
    );
    final response = await dio.get('/folder/findByUser', options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.data["result"] == true) {
      List<TreeNode> datas =   (response.data["data"] as List).map((jsonData) =>TreeNode.fromJson(jsonData)).toList();

      Get.find<TreeViewController>().listNodes.value = datas;
      return datas;

    } else {
      debugPrint("Server not response!");
      return [];
    }
  }
}

