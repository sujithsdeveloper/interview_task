import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Addassetcontroller extends ChangeNotifier {
  List BxDatas = [];
  Future<void> addData({required Map<String, dynamic> data}) async {
    var box = await Hive.openBox('assetBox');

    box.add(data);
    await getData();

    notifyListeners();
  }

  Future<void> updateData(
      {required int index, required Map<String, dynamic> newData}) async {
    var box = await Hive.openBox('assetBox');

    List keyList = box.keys.toList();

    var key = keyList[index];

    await box.put(key, newData);

    await getData();

    notifyListeners();
  }

  Future<void> getData() async {
    var box = await Hive.openBox('assetBox');

    BxDatas = box.values.toList();
    notifyListeners();
  }

  Future<void> deleteData({required int index}) async {
    var box = await Hive.openBox('assetBox');

    List keyList = box.keys.toList();
    box.delete(keyList[index]);

    BxDatas = box.values.toList();

    notifyListeners();
  }
}
