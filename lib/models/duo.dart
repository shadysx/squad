class Duo {
  final int id;
  final int userId1;
  final int userId2;

  const Duo({
    required this.id,
    required this.userId1,
    required this.userId2,
  });

  factory Duo.fromJson(Map<String, dynamic> json) {
    return Duo(
      id: json['id'] as int,
      userId1: json['userId1'] as int,
      userId2: json['userId2'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId1': userId1,
      'userId2': userId2,
    };
  }
}
