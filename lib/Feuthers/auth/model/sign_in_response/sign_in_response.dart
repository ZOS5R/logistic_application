import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  bool status;
  String message;
  String? email; // Assuming your API returns a token on successful sign in

  SignInResponse({
    required this.status,
    required this.message,
    this.email,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
