library my_library.model.token;

import 'package:json_annotation/json_annotation.dart';

part 'Token.g.dart';
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Token {
  String accessToken; // 令牌
  String name; // 用户昵称
  bool isAdmin; // 是否管理员
  String userId; // 用户ID
  String userEmail; // 用户邮箱
  String profileImagePath; // 用户头像
  bool shouldChangePassword; // 是否需要修改密码

  Token(this.accessToken, this.name, this.isAdmin, this.userId, this.userEmail,
      this.profileImagePath, this.shouldChangePassword);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
