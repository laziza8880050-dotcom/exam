class LessonModel {
  final String? description;
  final String? image;
  final String? kcal;
  final String? min;
  final String? name;
  final bool? video;
  final bool? zvezda;
  final String? son;

  LessonModel({
    this.son,
    this.description,
    this.image,
    this.kcal,
    this.min,
    this.name,
    this.video,
    this.zvezda,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      description: json['description'] as String?,
      image: json['image'] as String?,
      kcal: json['kcal'] as String?,
      min: json['min'] as String?,
      name: json['name'] as String?,
      video: json['video'] as bool?,
      zvezda: json['zvezda'] as bool?,
      son: json['son'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'image': image,
      'kcal': kcal,
      'min': min,
      'name': name,
      'video': video,
      'zvezda': zvezda,
      'son': son,

    };
  }
}