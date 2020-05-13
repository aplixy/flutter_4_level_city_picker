//
// Created with Android Studio.
// User: 三帆
// Date: 03/02/2019
// Time: 22:43
// email: sanfan.hx@alibaba-inc.com
// target:  xxx
//

import 'dart:convert';

/// CityPicker 返回的 **Result** 结果函数
class Result {
  /// provinceId
  String provinceId;

  /// cityId
  String cityId;

  /// areaId
  String areaId;

  String villageId;

  /// provinceName
  String provinceName;

  /// cityName
  String cityName;

  /// areaName
  String areaName;

  String villageName;

  Result(
      {this.provinceId,
      this.cityId,
      this.areaId,
      this.villageId,
      this.provinceName,
      this.cityName,
      this.areaName,
      this.villageName});

  /// string json
  @override
  String toString() {
    //TODO: implement toString
    Map<String, dynamic> obj = {
      'provinceId': provinceId,
      'provinceName': provinceName,

      'cityId': cityId,
      'cityName': cityName,

      'areaId': areaId,
      'areaName': areaName,

      'villageId': villageId,
      'villageName': villageName,
    };
    obj.removeWhere((key, value) => value == null);

    return json.encode(obj);
  }
}
