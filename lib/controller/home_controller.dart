import 'dart:convert';
import 'dart:io';

import 'package:countrieslist/constant.dart';
import 'package:countrieslist/model/countries_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  bool isLoading = false;
  bool isError = false;
  String? errorMessage;

  CountriesModel? countriesModel;

  Future<void> fetchData() async {
    try {
      isLoading = true;
      update();
      errorMessage = null;

      final response = await http.get(
        Uri.parse('$url/all'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final parsedJson = json.decode(response.body);
        countriesModel = CountriesModel.fromJson(parsedJson);

      } else {
        errorMessage = json.decode(response.body)['message'];
        isError = true;
      }
    } catch (e) {
      if (e is SocketException) {
        errorMessage = 'Please check your network and try again';
      } else {
        errorMessage = 'Something went wrong.';
      }
      isError = true;
    } finally {
      isLoading = false;
    }
    update();
  }
}
