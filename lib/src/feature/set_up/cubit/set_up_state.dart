class SetUpState {
  Map<String, dynamic>? userInfo;
  final SetUpStatus status;
  SetUpState({this.userInfo, this.status = SetUpStatus.initial});

  SetUpState copyWith({Map<String, dynamic>? userInfo, SetUpStatus? status}) => SetUpState(
    userInfo: userInfo ?? this.userInfo,
    status:  status ?? this.status,
  );
}

enum SetUpStatus {initial, loading, error, success}