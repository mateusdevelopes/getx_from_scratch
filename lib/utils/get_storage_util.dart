import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class GetStorageUtil {
  static GetStorage _getInstance = GetStorage();

  ///Pass the fromMap of a model to be returned,
  ///if it exists the model will be returned,
  ///if it does not exist null will be returned
  static T? getStorage<T>({required T fromMap(Map<String, dynamic> fromMap)}) {
    final strJson = _getInstance.read(T.toString());
    if (strJson == null)
      return null;
    else if (strJson.runtimeType == T)
      return strJson;
    else
      return fromMap(json.decode(strJson));
  }

  ///Pass the keySaved of a value to be returned,
  ///if it exists the value will be returned,
  ///if it does not exist null will be returned
  static T? getByKey<T>({required KeySaved keySaved}) {
    final strJson = _getInstance.read(keySaved.toString());
    if (strJson == null)
      return null;
    else if (strJson.runtimeType == T)
      return strJson;
    else
      return json.decode(strJson) as T;
  }

  ///Pass the fromMap of a model to be returned list,
  ///if it exists a list the model will be returned,
  ///if it does not exist null will be returned
  static List<T>? getStorageList<T>(
      {required T fromMap(Map<String, dynamic> fromMap)}) {
    final listTypes = [
      'List<${T.toString()}>',
      'GrowableList<${T.toString()}>',
      '_List<${T.toString()}>',
      '_GrowableList<${T.toString()}>'
    ];

    var strJson;
    for (var type in listTypes)
      if (_getInstance.hasData(type)) strJson = _getInstance.read(type);

    if (strJson == null)
      return null;
    else if (strJson.runtimeType == <T>[].runtimeType)
      return strJson;
    else {
      var list = <T>[];
      for (final tValue in strJson) list.add(fromMap(json.decode(tValue)));
      return list;
    }
  }

  ///Pass a model to be saved or overwritten
  static Future<void> save<T>({required T? value}) async {
    if (value == null) return;
    await _getInstance.write(value.runtimeType.toString(), value);
  }

  ///Pass a key to be saved or overwritten
  static Future<void> saveByKey<T>(
      {required KeySaved? keysaved, required T value}) async {
    if (value == null) return;
    await _getInstance.write(keysaved.toString(), value);
  }

  ///If you do not sign with the model type
  ///will not be erased anything
  static Future<void> delete<T>() async {
    return await _getInstance.remove(T.toString());
  }

  static Future<void> deleteFullLists<T>() async {
    final listTypes = [
      'List<${T.toString()}>',
      'GrowableList<${T.toString()}>',
      '_List<${T.toString()}>',
      '_GrowableList<${T.toString()}>'
    ];
    for (var type in listTypes) await _getInstance.remove(type);
  }

  ///return data true if value is different of null;
  static bool hasData<T>() {
    return _getInstance.hasData(T.toString());
  }
}

enum KeySaved { isVersionOfProduction }
