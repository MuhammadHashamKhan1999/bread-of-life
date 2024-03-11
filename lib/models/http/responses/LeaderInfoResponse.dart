// To parse this JSON data, do
//
//     final leaderInfoResponse = leaderInfoResponseFromJson(jsonString);

import 'dart:convert';

LeaderInfoResponse leaderInfoResponseFromJson(String str) => LeaderInfoResponse.fromJson(json.decode(str));

String leaderInfoResponseToJson(LeaderInfoResponse data) => json.encode(data.toJson());

class LeaderInfoResponse {
  LeaderInfoResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory LeaderInfoResponse.fromJson(Map<String, dynamic> json) => LeaderInfoResponse(
    status: json["status"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.leadersId,
    this.branchId,
    this.name,
    this.description,
    this.socialLink,
    this.socialIcon,
    this.image,
    this.createdAt,
    this.branchName,
  });

  String? id;
  String? leadersId;
  String? branchId;
  String? name;
  String? description;
  String? socialLink;
  String? socialIcon;
  String? image;
  DateTime? createdAt;
  String? branchName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    leadersId: json["leaders_id"],
    branchId: json["branch_id"],
    name: json["name"],
    description: json["description"],
    socialLink: json["social_link"],
    socialIcon: json["social_icon"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    branchName: json["branch_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "leaders_id": leadersId,
    "branch_id": branchId,
    "name": name,
    "description": description,
    "social_link": socialLink,
    "social_icon": socialIcon,
    "image": image,
    "created_at": createdAt!.toIso8601String(),
    "branch_name": branchName,
  };
}
