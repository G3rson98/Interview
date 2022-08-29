import 'dart:convert';

import 'package:test1/data/models/mascota.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage();

  Future<void> savePet({required Mascota mascota}) async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    ;
    List<String>? pets = instance.getStringList('pet');
    if (pets != null) {
      pets.add(jsonEncode(mascota.toJson()));
    } else {
      pets = [jsonEncode(mascota.toJson())];
    }
    await instance.setStringList('pet', pets);
  }

  Future<List<Mascota>> getPet() async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    List<String>? pets = instance.getStringList('pet');

    if (pets != null) {
      final List<Mascota> newpets = [];
      pets.forEach((e) {
        newpets.add(Mascota.fromJson(jsonDecode(e)));
      });
      return newpets;
    } else {
      return [];
    }
  }
}
