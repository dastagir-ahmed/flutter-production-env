import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/job_model.dart';

class HttpUtil{
  Future<JobModel?> fetchData() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/home');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data.toString());
      final model = JobModel.fromJson(data);
      return model;
    } else {
      print('data: ${response.statusCode}');
      return null;
    }
  }
}