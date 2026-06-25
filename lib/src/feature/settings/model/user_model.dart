class UserModel {
  final String? name;

  final int? cm;
  final String? gender;
  final String? goal;
  final String? level;
  final int? old;
  final int? width;

  UserModel({
    this.name,
    this.cm,
    this.gender,
    this.goal,
    this.level,
    this.old,
    this.width,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(
    name: json['name'] as String?,
    cm: (json['cm'] as num?)?.toInt(),
    gender: json['gender'] as String?,
    goal: json['goal'] as String?,
    level: json['level'] as String?,
    old: (json['old'] as num?)?.toInt(),
    width: (json['width'] as num?)?.toInt(),
  );
}
  Map<String, dynamic> toJson() {
    return {
      'name' :name,
      'cm': cm,
      'gender': gender,
      'goal': goal,
      'level': level,
      'old': old,
      'width': width,
    };
  }
}