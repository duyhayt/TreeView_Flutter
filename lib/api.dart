import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'controller.dart';
import 'model.dart';
import 'package:get/get.dart';



class ApiFolder {
  Future< List<TreeNode>> fetchTreeData() async {
    String url = 'http://183.91.3.60:8080/sca-0.2';
    String token ="eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJZMXhoT25mc2tfelF5SnhKODFFWjZXdjBLUUF0LWNCdW5QdU9vTTlqZkxRIn0.eyJleHAiOjE2ODYwODI4MzQsImlhdCI6MTY4NjA0NjgzNCwianRpIjoiNWM3NTYxNDctMDI4OS00OWNkLWIwOTAtY2ZhMDQ5NWQ2MDFmIiwiaXNzIjoiaHR0cHM6Ly9zZWMuY21jYXRpLnZuL2lhbS9yZWFsbXMvQ0lTVF8xIiwiYXVkIjpbInNzYV9iYWNrZW5kIiwiYWNjb3VudCJdLCJzdWIiOiJiNGFlOTg3Mi05MTA2LTQ5MzUtODNlNS0zYmY0ZWI4NzE5NzgiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzY2EtYmFjay1lbmQiLCJzZXNzaW9uX3N0YXRlIjoiNzgzMjQ5OTAtYjI5Zi00ZmFkLTk1M2QtMTUxNGZhMDVhMDVlIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyJodHRwOi8vbG9jYWxob3N0OjgwODAiLCJodHRwczovL3NlYy5jbWNhdGkudm4iXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwiZGVmYXVsdC1yb2xlcy1jaXN0XzEiLCJ1bWFfYXV0aG9yaXphdGlvbiIsIlVTRVIiXX0sInJlc291cmNlX2FjY2VzcyI6eyJzY2EtYmFjay1lbmQiOnsicm9sZXMiOlsiRWRpdE90aGVyRG9jdW1lbnQiLCJBZGRQZXJzb25hbERvY3VtZW50IiwiU2lnbk1hbnkiLCJVU0VSX1NDQSJdfSwic3NhX2JhY2tlbmQiOnsicm9sZXMiOlsiVVNFUl9TU0EiXX0sImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsInNpZCI6Ijc4MzI0OTkwLWIyOWYtNGZhZC05NTNkLTE1MTRmYTA1YTA1ZSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6Ik5ndXnhu4VuIEjDoCIsInByZWZlcnJlZF91c2VybmFtZSI6ImR1eWhhLnl0QGdtYWlsLmNvbSIsImdpdmVuX25hbWUiOiJOZ3V54buFbiIsImZhbWlseV9uYW1lIjoiSMOgIiwiZW1haWwiOiJkdXloYS55dEBnbWFpbC5jb20ifQ.guU91ufp843vFrFtgP6s_B0jUTmuwWrEb-bvhIhkc5onglc9NF9IheDspsPDBs-8QlQeIhqwcGkD4Y9CE76Kemz3I4n_4kJw_8d4FI1HOymPsYNrLFP61_zwTl0Hwx5xxY0fCnV7pNV-FIHs9geLWWR0BgmvQD_ydSsaAfH-CYIdyu61PDP5bwW7JKWsttiR9ejAJVxmKxtnNZhDcF61jHVAcl2Mj9LRffazjBEn3VlHBeR3mrxUuRrNUrQ491mIRzHI-exavcYU8-U931fI0yh89VZwqkxfumav21WiWA5M8G9ovIlRuUXxc1lhTkVIfrFXuWfxHOrFk-6oeq5aYw";
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

