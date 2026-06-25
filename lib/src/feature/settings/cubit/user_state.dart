import 'package:equatable/equatable.dart';
import 'package:fitness/src/feature/settings/model/user_model.dart';

class ProfileState extends Equatable {
  final ProfileStatus status;
  final String? errorText;
  final UserModel? user;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.errorText,
    this.user,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    String? errorText,
    UserModel? user,
  }) {
    return ProfileState(
      status: status ?? this.status,
      errorText: errorText ?? this.errorText,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorText,
        user,
      ];
}
enum ProfileStatus {
  initial,
  loading,
  success,
  error,
}