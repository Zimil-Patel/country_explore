import 'dart:convert';
import 'dart:developer';

import 'package:exp_country/helper/api_helper.dart';
import 'package:exp_country/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  List<CountryModel> coutryLsit = [];

  List<String> favCountryList = [];
  List<CountryModel> favCountryModelList = [];

  // chekc if fav
  bool checkIsFav(String name) => favCountryList.contains(name);

  // save preference
  Future<void> savePrefernce(CountryModel countryModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (favCountryModelList.contains(countryModel)) {
      log("Already added...");
    } else {
      final name = countryModel.name.common;
      favCountryList.add(name);
      favCountryModelList.add(countryModel);
      bool result = await pref.setStringList('favList', favCountryList);
      log("Saved Pref.. : $result");
    }

    notifyListeners();
  }

  // REMOVE PREFERENCE
  Future<void> removePrefernce(CountryModel countryModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final name = countryModel.name.common;
    for (int i = 0; i < favCountryModelList.length; i++) {
      final data = favCountryModelList[i];
      if (data.name.common == name) {
        favCountryModelList.removeAt(i);
      }
    }
    favCountryList.remove(name);
    bool result = await pref.setStringList('favList', favCountryList);
    log("Removed Pref.. : $result");

    notifyListeners();
  }

  // GET PREF
  Future<void> getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    favCountryList.clear();
    favCountryList = pref.getStringList('favList') ?? [];
    for (var i in favCountryList) {
      for (var country in coutryLsit) {
        if (country.name.common == i) {
          favCountryModelList.add(country);
        }
      }
    }
    notifyListeners();
    log("Got Pref: $favCountryModelList");
  }

  Future<void> fecthData() async {
    const apiEndPoint = "https://restcountries.com/v3.1/all";
    String data = await ApiHelper.apiHelper.callApi(apiEndPoint);
    final listOfCountry = jsonDecode(data);
    coutryLsit =
        (listOfCountry as List).map((e) => CountryModel.fromJson(e)).toList();
  }

  Future<void> _init() async {
    await fecthData();
    await getPref();
  }

  HomeProvider(){
    _init();
  }
}
