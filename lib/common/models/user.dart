class User {
  User({
    required this.id,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        isVerified: json['isVerified'],
      );
  int id;
  int isVerified;

  Map<String, dynamic> toJson() => {
        'id': id,
        'isVerified': isVerified,
      };
}
