class RegisterResponse {
  final String id;
  final String email;

  RegisterResponse({required this.id, required this.email});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      id: json["_id"],
      email: json["email"],
    );
  }
}