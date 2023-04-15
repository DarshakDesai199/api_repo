import 'dart:convert';

import 'package:api_repo/api_services/api_routes.dart';
import 'package:api_repo/api_services/api_service.dart';
import 'dart:convert';

class GetStoreRepo extends ApiRoutes {
  Future<dynamic> getStoresRepo() async {
    // var header = {'Authorization': 'Bearer ${PreferenceManager.getToken()}'};
    var headers = '';
    var response = await ApiService().getResponse(
        apiType: APIType.aGet, url: ApiRoutes.getBodyParts, header: headers);

    // print('RESPONSE:- ${response}');
    // List<GetEventResponseModel> getEventResponseModel =
    //     getEventResponseModelFromJson(jsonEncode(response));

    List<GetStoreResponseModel> getStoreResponseModel =
        getStoreResponseModelFromJson(jsonEncode(response));
    return getStoreResponseModel;
  }
}

List<GetStoreResponseModel> getStoreResponseModelFromJson(String str) =>
    List<GetStoreResponseModel>.from(
        json.decode(str).map((x) => GetStoreResponseModel.fromJson(x)));

String getStoreResponseModelToJson(List<GetStoreResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStoreResponseModel {
  GetStoreResponseModel({
    this.id,
    this.name,
    this.storeCode,
    this.ownerName,
    this.phoneNo,
    this.isNotify,
    this.isMailNotify,
    this.mapLocation,
    this.email,
    this.photo,
    this.addressLine1,
    this.addressLine2,
    this.country,
    this.state,
    this.city,
    this.address,
    this.password,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.intrestId,
    this.status,
    this.theme,
    this.verification,
  });

  int? id;
  String? name;
  String? storeCode;
  String? ownerName;
  String? phoneNo;
  int? isNotify;
  int? isMailNotify;
  String? mapLocation;
  String? email;
  String? photo;
  String? addressLine1;
  String? addressLine2;
  String? country;
  String? state;
  String? city;
  String? address;
  String? password;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? intrestId;
  int? status;
  Theme? theme;
  int? verification;

  factory GetStoreResponseModel.fromJson(Map<String, dynamic> json) =>
      GetStoreResponseModel(
        id: json["id"],
        name: json["name"],
        storeCode: json["store_code"] == null ? null : json["store_code"],
        ownerName: json["owner_name"] == null ? null : json["owner_name"],
        phoneNo: json["phone_no"] == null ? null : json["phone_no"],
        isNotify: json["is_notify"],
        isMailNotify: json["is_mail_notify"],
        mapLocation: json["map_location"] == null ? null : json["map_location"],
        email: json["email"],
        photo: json["photo"] == null ? null : json["photo"],
        addressLine1:
            json["address_line_1"] == null ? null : json["address_line_1"],
        addressLine2:
            json["address_line_2"] == null ? null : json["address_line_2"],
        country: json["country"] == null ? null : json["country"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        password: json["password"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        intrestId: json["intrest_id"] == null ? null : json["intrest_id"],
        status: json["status"],
        theme: themeValues.map![json["theme"]],
        verification: json["verification"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "store_code": storeCode == null ? null : storeCode,
        "owner_name": ownerName == null ? null : ownerName,
        "phone_no": phoneNo == null ? null : phoneNo,
        "is_notify": isNotify,
        "is_mail_notify": isMailNotify,
        "map_location": mapLocation == null ? null : mapLocation,
        "email": email,
        "photo": photo == null ? null : photo,
        "address_line_1": addressLine1 == null ? null : addressLine1,
        "address_line_2": addressLine2 == null ? null : addressLine2,
        "country": country == null ? null : country,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "address": address == null ? null : address,
        "password": password,
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "intrest_id": intrestId == null ? null : intrestId,
        "status": status,
        "theme": themeValues.reverse[theme],
        "verification": verification,
      };
}

enum Theme { DARK, LIGHT }

final themeValues = EnumValues({"dark": Theme.DARK, "light": Theme.LIGHT});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
