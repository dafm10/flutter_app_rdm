class UserModel {
  String role;
  String cop;
  String phone;
  String name;
  String email;
  String? id;
  bool status;

  UserModel({
    required this.role,
    required this.cop,
    required this.phone,
    required this.name,
    required this.email,
    required this.status,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        role: json["role"],
        cop: json["cop"],
        phone: json["phone"],
        name: json["name"],
        email: json["email"],
        id: json["id"] ?? "",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "cop": cop,
        "phone": phone,
        "name": name,
        "email": email,
        "id": id ?? "",
        "status": status,
      };
}
