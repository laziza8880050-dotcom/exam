import 'package:equatable/equatable.dart';
import 'package:fitness/src/feature/home/model/lesson_model.dart';
class HomeState extends Equatable {
  final HomeStatus status;
  final String? errorText;
  final List<LessonModel> lesson;

  const HomeState({
    this.status = HomeStatus.initial,
    this.errorText,
    this.lesson = const [],
  });

  @override
  List<Object?> get props => [lesson, status];

  get newIndex => null;
}



enum HomeStatus { initial, loading, error, succes }
