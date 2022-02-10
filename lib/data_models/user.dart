import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.data,
    required this.authKey,
    required this.authToken,
    required this.updateUserProfileInfo,
  });

  UserData? data;
  String authKey;
  String authToken;
  bool updateUserProfileInfo;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        authKey: json["authKey"] ?? '',
        authToken: json["authToken"] ?? "",
        updateUserProfileInfo: json["updateUserProfileInfo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "authKey": authKey,
        "authToken": authToken,
        "updateUserProfileInfo": updateUserProfileInfo,
      };
}

class UserData {
  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    this.postalCode,
    required this.email,
    required this.mobile,
    this.userProfile,
    this.userProfileFile,
    this.userProfileFilePath,
    this.userProfileUrl,
    required this.role,
    required this.isVerified,
    required this.isActive,
    required this.isLoggedIn,
  });

  String id;
  String firstName;
  String lastName;
  String address;
  dynamic postalCode;
  String email;
  String mobile;
  dynamic userProfile;
  dynamic userProfileFile;
  dynamic userProfileFilePath;
  dynamic userProfileUrl;
  int role;
  bool isVerified;
  bool isActive;
  bool isLoggedIn;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        address: json["address"] ?? "",
        postalCode: json["postalCode"] ?? "",
        email: json["email"] ?? "",
        mobile: json["mobile"]?.toString() ?? "",
        userProfile: json["userProfile"],
        userProfileFile: json["userProfileFile"],
        userProfileFilePath: json["userProfileFilePath"],
        userProfileUrl: json["userProfileURL"],
        role: json["role"] ?? 0,
        isVerified: json["isVerified"] ?? false,
        isActive: json["isActive"] ?? false,
        isLoggedIn: json["isLoggedIn"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "postalCode": postalCode,
        "email": email,
        "mobile": mobile,
        "userProfile": userProfile,
        "userProfileFile": userProfileFile,
        "userProfileFilePath": userProfileFilePath,
        "userProfileURL": userProfileUrl,
        "role": role,
        "isVerified": isVerified,
        "isActive": isActive,
        "isLoggedIn": isLoggedIn,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserData && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
