import 'package:fitness/src/feature/settings/model/user_model.dart';
import 'package:equatable/equatable.dart';
class UserState extends Equatable {
  final UserStatus status;
  final String? errorText;
  final List<UserModel> user;

  const UserState({
    this.status = UserStatus.initial,
    this.errorText,
    this.user = const [],
  });

  @override
  List<Object?> get props => [user, status];

  get newIndex => null;
}



enum UserStatus { initial, loading, error, succes }
