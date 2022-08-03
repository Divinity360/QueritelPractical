import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ubenwa/models/pet_model.dart';
import 'package:ubenwa/utils/constants.dart';
import 'package:ubenwa/utils/extensions.dart';

class ApiService {
  static Future<List<PetModel>> getAllCats() async {
    var response = await http.get(Uri.parse(AppConstants.catsApiUrl));
    log(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final List dataList = json.decode(response.body)["cats"];
      return dataList.mapListToPetModel;
    }
    return [];
  }

  static Future<List<PetModel>> getAllDogs() async {
    var response = await http.get(Uri.parse(AppConstants.dogsApiUrl));
    log(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final List dataList = json.decode(response.body)["dogs"];
      return dataList.mapListToPetModel;
    }
    return [];
  }
}
