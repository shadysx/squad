class User {
  final String lastName;
  final String firstName;
  final int age;
  final String gender;
  final String sexualOrientation;
  final String photoUrl;

  User({
    required this.lastName,
    required this.firstName,
    required this.age,
    required this.gender,
    required this.sexualOrientation,
    required this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      lastName: json['lastName'],
      firstName: json['firstName'],
      age: json['age'],
      gender: json['gender'],
      sexualOrientation: json['sexualOrientation'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastName': lastName,
      'firstName': firstName,
      'age': age,
      'gender': gender,
      'sexualOrientation': sexualOrientation,
      'photoUrl': photoUrl,
    };
  }
}
