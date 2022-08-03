import 'package:flutter/material.dart';
import 'package:ubenwa/models/pet_model.dart';
import 'package:ubenwa/services/api_service.dart';

enum Pet { cat, dog }

class PetProvider extends ChangeNotifier {
  bool _loading = false;
  List<PetModel> _petList = [];

  bool get loading => _loading;

  List<PetModel> get petList => _petList;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set petList(List<PetModel> value) {
    _petList = value;
    notifyListeners();
  }

  void fetchPetList(int index) async {
    loading = true;
    petList = index == 0
        ? await ApiService.getAllCats()
        : await ApiService.getAllDogs();
    loading = false;
  }
}